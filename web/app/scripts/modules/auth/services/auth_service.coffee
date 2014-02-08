define(['loglevel', './../module', './roles_service', './users_service' ], (log) ->
  class AuthService
    constructor: (@$http, @$cookieStore, @configuration, usersService) ->
      @userRoles = routingConfig.userRoles
      @currentUser =  @$cookieStore.get("user") or username: "", role: @userRoles.public
      @accessLevels = routingConfig.accessLevels
#      @accessLevels: accessLevels
#      @userRoles: userRoles
      @user = @currentUser
#    @$cookieStore.remove "user"

    changeUser = (user) ->
      _.extend @currentUser, user

    authorize: (accessLevel, role) ->
      role = @currentUser.role  if role is `undefined`
      accessLevel.bitMask & role.bitMask

    isLoggedIn: (user) ->
      user = @currentUser if user is `undefined`
      console.log("rolemask: #{user.roleMask}")
      user.rolesMask > 0

    register: (user, success, error) ->
      @$http.post("/register", user).success((res) ->
        changeUser res
        success()
      ).error error

    login: (user, success, error) ->
      url = @configuration.oauthio.callbackUri
      log.debug("Making request to login: #{url}")
      json = JSON.stringify(user.res)
      @$http.post(url, json).success((response) ->
        log.debug("Request was successful: ")
        log.debug(response)
        changeUser(response.user)
        success()
      ).error(error)

    logout: (success, error) ->
      @$http.post("/logout").success(->
        changeUser
          username: ""
          role: @userRoles.public

        success()
      ).error error

  namespace 'auth', (exports) ->
    exports.AuthService = AuthService
    exports.module.service 'Auth', AuthService

)