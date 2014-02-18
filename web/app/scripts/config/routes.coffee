namespace 'streamCommander', (exports) ->
  exports.app.config(["$routeProvider", "$locationProvider", "$httpProvider", ($routeProvider, $locationProvider, $httpProvider) ->
#    access = routingConfig.accessLevels

    $routeProvider.when "/",
      templateUrl: "home"
      controller: "HomeCtrl"

    $routeProvider.when "/login",
      templateUrl: "login"
      controller: "LoginCtrl"

#
#    $routeProvider.when "/register",
#      templateUrl: "register"
#      controller: "RegisterCtrl"
#      access: access.anon
#
#    $routeProvider.when "/private",
#      templateUrl: "private"
#      controller: "PrivateCtrl"
#      access: access.user
#
#    $routeProvider.when "/admin",
#      templateUrl: "admin"
#      controller: "AdminCtrl"
#      access: access.admin
#
    $routeProvider.when "/404",
      templateUrl: "404"

    $routeProvider.otherwise redirectTo: "/404"
    $locationProvider.html5Mode true
#    $httpProvider.interceptors.push ($q, $location) ->
#      responseError: (response) ->
#        if response.status is 401 or response.status is 403
#          $location.path "/login"
#          $q.reject response
#        else
#          $q.reject response

  ])
#  .run ["$rootScope", "$location", "$http", ($rootScope, $location, $http) ->
#    $rootScope.$on "$routeChangeStart", (event, next, current) ->
#      $rootScope.error = null
#      unless Auth.authorize(next.access)
#        if Auth.isLoggedIn()
#          $location.path "/"
#        else
#          $location.path "/login"
#
#  ]
