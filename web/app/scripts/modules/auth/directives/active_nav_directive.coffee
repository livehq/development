"use strict"
define(['./../module'], ->
  activeNavDirective = ($location) ->
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

  namespace 'auth', (exports) ->
    exports.module.directive "activeNav", ["$location", activeNavDirective]
)
