class HeadPanelCtrl
  #  exports.module.controller "NavCtrl", ["$rootScope", "$scope", "$location", "Auth", "configuration", ($rootScope, $scope, $location, Auth, configuration) ->
  constructor: ($rootScope, $scope, $location, configuration, currentUser) ->
    $scope.currentUser = currentUser

    $scope.logout = ->
     $scope.currentUser.logout()
#      Auth.logout (->
#        $location.path "/login"
#      ), ->
#        $rootScope.error = "Failed to logout"


namespace 'streamCommander', (exports) ->
  exports.app.controller 'HeadPanelCtrl', HeadPanelCtrl
  exports.HeadPanelCtrl = HeadPanelCtrl

