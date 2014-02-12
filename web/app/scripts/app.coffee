'use strict'

NAMESPACE = 'streamCommander'
app = angular.module('webApp', [
  'config',
#  'ngCookies',
#  'ngResource',
#  'ngSanitize',
#  'ngRoute',
#  'oauthio',
#  'auth'
])

# make this configurable
angular.module("config", []).constant "ENV", "development"

namespace NAMESPACE, (exports) ->
  exports.NAMESPACE = NAMESPACE
  exports.app = app
