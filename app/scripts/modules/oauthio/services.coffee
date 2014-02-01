define(['namespace', 'oauthJs', './module'], ->
  class OauthioService
    constructor: (configuration) ->
      OAuth.initialize(configuration.oauthioPublickey)

    oauthio: OAuth

#    OAuth.popup provider, {state: 1}, (err, res) ->
#      if (err)
#        console.log err
#  #          $window.location.href = "/login"
#      else
#        Auth.login
#          username: 'username'
#          password: 'password'
#          rememberme: false
#          res: res
#        , ((res) ->
#          $location.path "/"
#        ), (err) ->
#          $rootScope.error = "Failed to login"

#      new_csrf_token: ->
#        csrf_token = generateUid() # generate any random string
#        req.session.csrf_tokens = req.session.csrf_tokens or []
#        req.session.csrf_tokens.push csrf_token
#        req.session.csrf_tokens.shift()  if req.session.csrf_tokens.length > 4 # keep 4 tokens max
#        res.render "login_page",
#          oauthio_state: csrf_token

  namespace 'oauthio', (exports) ->
    exports.module.service 'oauthioService', OauthioService

)