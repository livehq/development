"use strict"
define(['./module', './routes', './users_service'], ->
  angular.module("auth").factory "Auth", ($http, $cookieStore, configuration, usersService) ->
    changeUser = (user) ->
      _.extend currentUser, user
    accessLevels = routingConfig.accessLevels
    userRoles = routingConfig.userRoles
    currentUser = $cookieStore.get("user") or
    username: ""
    role: userRoles.public

    $cookieStore.remove "user"
    authorize: (accessLevel, role) ->
      role = currentUser.role  if role is `undefined`
      accessLevel.bitMask & role.bitMask

    isLoggedIn: (user) ->
      user = currentUser if user is `undefined`
      console.log("rolemask: #{user.roleMask}")
      user.rolesMask > 0

    register: (user, success, error) ->
      $http.post("/register", user).success((res) ->
        changeUser res
        success()
      ).error error

    login: (user, success, error) ->
      url = configuration.oauthio.callbackUri
      json = JSON.stringify(user.res)
      $http.post(url, json).success((response) ->
        changeUser(response.user)
        success()
      ).error(error)

    logout: (success, error) ->
      $http.post("/logout").success(->
        changeUser
          username: ""
          role: userRoles.public

        success()
      ).error error

    accessLevels: accessLevels
    userRoles: userRoles
    user: currentUser

  angular.module("auth").factory "Users", ($http) ->
    getAll: (success, error) ->
      $http.get("/users").success(success).error error

)
