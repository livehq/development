'use strict'
define(['namespace', 'angular'], ->
  module = angular.module('oauthio', [])

  namespace 'oauthio', (exports) ->
    exports.module = module

)