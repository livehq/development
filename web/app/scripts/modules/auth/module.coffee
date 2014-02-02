"use strict"
define(['namespace', 'angular'], ->
  module = angular.module("auth", ["ngCookies", "ngRoute"])

  namespace 'auth', (exports) ->
    exports.module = module
)