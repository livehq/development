#streamCommander.app
#.config ["$sceDelegateProvider", "configuration", ($sceDelegateProvider, configuration) ->
#    console.log('inside scedelegate')
#    console.log(configuration.whitelist)
#    $sceDelegateProvider.resourceUrlWhitelist configuration.whitelist
#]
#
#streamCommander.app
## See https://github.com/angular/angular.js/pull/1454
## Evaluate the safety of this
#  .config(($httpProvider) ->
#      $httpProvider.defaults.useXDomain = true
#      delete $httpProvider.defaults.headers.common['X-Requested-With']
#      $httpProvider.defaults.withCredentials = true
#    )
