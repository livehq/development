"use strict"
define(['namespace'], ->
  module = angular.module("auth", ["ngCookies", "ngRoute"]).config(["$routeProvider", "$locationProvider", "$httpProvider", ($routeProvider, $locationProvider, $httpProvider) ->
    access = routingConfig.accessLevels
    $routeProvider.when "/",
      templateUrl: "home"
      controller: "HomeCtrl"
      access: access.anon

    $routeProvider.when "/login",
      templateUrl: "login"
      controller: "LoginCtrl"
      access: access.anon

    $routeProvider.when "/register",
      templateUrl: "register"
      controller: "RegisterCtrl"
      access: access.anon

    $routeProvider.when "/private",
      templateUrl: "private"
      controller: "PrivateCtrl"
      access: access.user

    $routeProvider.when "/admin",
      templateUrl: "admin"
      controller: "AdminCtrl"
      access: access.admin

    $routeProvider.when "/404",
      templateUrl: "404"
      access: access.public

    $routeProvider.otherwise redirectTo: "/404"
    $locationProvider.html5Mode true
    $httpProvider.interceptors.push ($q, $location) ->
      responseError: (response) ->
        if response.status is 401 or response.status is 403
          $location.path "/login"
          $q.reject response
        else
          $q.reject response

  ]).run ["$rootScope", "$location", "$http", "Auth", ($rootScope, $location, $http, Auth) ->
    $rootScope.$on "$routeChangeStart", (event, next, current) ->
      $rootScope.error = null
      unless Auth.authorize(next.access)
        if Auth.isLoggedIn()
          $location.path "/"
        else
          $location.path "/login"

  ]

  namespace 'auth', (exports) ->
    exports.module = module
)