define(['../module'], ->
  accessLevelDirective = (Auth) ->
    restrict: "A"
    link: ($scope, element, attrs) ->
      updateCSS = ->
        if userRole and accessLevel
          unless Auth.authorize(accessLevel, userRole)
            element.css "display", "none"
          else
            element.css "display", prevDisp
      prevDisp = element.css("display")
      userRole = undefined
      accessLevel = undefined
      $scope.user = Auth.user
      $scope.$watch "user", ((user) ->
        userRole = user.role  if user.role
        updateCSS()
      ), true
      attrs.$observe "accessLevel", (al) ->
        accessLevel = $scope.$eval(al)  if al
        updateCSS()

  namespace 'auth', (exports) ->
    exports.module.directive "accessLevel", ["Auth", accessLevelDirective]
)