class LoginCtrl
  constructor: ($rootScope, $scope, configuration) ->
    $scope.configuration = configuration

namespace 'streamCommander', (exports) ->
  exports.app.controller 'LoginCtrl', LoginCtrl
  exports.LoginCtrl = LoginCtrl

