log = require('log')
cancan = require('cancanjs')
devise = require('devisejs')

class InitializationService
  constructor: (@$http, @configuration, @currentUser) ->

  initSite: ->
    log.debug("Making request to: #{@configuration.api.allAggregateUrl}")
    @$http.get(@configuration.api.allAggregateUrl).success((response) =>
      @currentUser.loadRoles(response.roles)
#      devise.loadRoles(response.roles)
    ).error((response) =>
      log.debug(response)
    )

namespace 'streamCommander', (exports) ->
  exports.InitializationService = InitializationService
  exports.app.service 'initializationService', InitializationService
