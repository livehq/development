"use strict"
define(['./module'], ->
  angular.module("auth").directive "accessLevel", ["Auth", (Auth) ->
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

  ]
  angular.module("auth").directive "activeNav", ["$location", ($location) ->
    restrict: "A"
    link: (scope, element, attrs) ->
      nestedA = element.find("a")[0]
      path = nestedA.href
      scope.location = $location
      scope.$watch "location.absUrl()", (newPath) ->
        if path is newPath or path is newPath + "/" or path + "/" is newPath
          element.addClass "active"
        else
          element.removeClass "active"

  ]

)
