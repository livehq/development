"use strict"

define(['./module', './services'], ->
# Controllers
  angular.module("auth").controller "NavCtrl", ["$rootScope", "$scope", "$location", "Auth", "configuration", ($rootScope, $scope, $location, Auth, configuration) ->
    $scope.enableRegistration = configuration.siteOptions.enableRegistration
    $scope.user = Auth.user
    $scope.userRoles = Auth.userRoles
    $scope.accessLevels = Auth.accessLevels
    $scope.logout = ->
      Auth.logout (->
        $location.path "/login"
      ), ->
        $rootScope.error = "Failed to logout"

  ]
  angular.module("auth").controller "LoginCtrl", ["$rootScope", "$scope", "$location", "$window", "Auth", "configuration", "oauthioService", ($rootScope, $scope, $location, $window, Auth, configuration, oauthioService) ->
    $scope.enableForm = configuration.siteOptions.login.enableForm
    $scope.enableOauth = configuration.siteOptions.login.enableOauth
    $scope.rememberme = true
    $scope.login = ->
      Auth.login
        username: $scope.username
        password: $scope.password
        rememberme: $scope.rememberme
      , ((res) ->
        $location.path "/"
      ), (err) ->
        $rootScope.error = "Failed to login"


    $scope.loginOauth = (provider) ->
      oauthioService.oauthio.popup provider, {state: 1}, (err, res) ->
        if (err)
          console.log err
#          $window.location.href = "/login"
        else
          Auth.login
            username: 'username'
            password: 'password'
            rememberme: false
            res: res
          , ((res) ->
              $location.path "/"
          ), (err) ->
            $rootScope.error = "Failed to login"


#      $window.location.href = "/auth/" + provider
#      $window.location.href = "localhost:3000/users/auth/" + provider
  ]
  angular.module("auth").controller "HomeCtrl", ["$rootScope", ($rootScope) ->
  ]
  angular.module("auth").controller "RegisterCtrl", ["$rootScope", "$scope", "$location", "Auth", ($rootScope, $scope, $location, Auth) ->
    $scope.role = Auth.userRoles.user
    $scope.userRoles = Auth.userRoles
    $scope.register = ->
      Auth.register
        username: $scope.username
        password: $scope.password
        role: $scope.role
      , (->
        $location.path "/"
      ), (err) ->
        $rootScope.error = err

  ]
  angular.module("auth").controller "PrivateCtrl", ["$rootScope", ($rootScope) ->
  ]
  angular.module("auth").controller "AdminCtrl", ["$rootScope", "$scope", "Users", "Auth", ($rootScope, $scope, Users, Auth) ->
    $scope.loading = true
    $scope.userRoles = Auth.userRoles
    Users.getAll ((res) ->
      $scope.users = res
      $scope.loading = false
    ), (err) ->
      $rootScope.error = "Failed to fetch users."
      $scope.loading = false

  ]
)
