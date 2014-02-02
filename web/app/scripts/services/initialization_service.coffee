define(['loglevel', './../app'], (log) ->
  class InitializationService
    constructor: (@$http, @configuration, @rolesService) ->

    initSite: ->
      log.debug('calling service')
      @$http.get(@configuration.api.allAggregateUrl).success((response) ->
        log.debug(response)
      ).error((response) ->
        log.debug(response)
      )

  namespace 'streamCommander', (exports) ->
    exports.InitializationService = InitializationService
    exports.app.service 'initializationService', InitializationService
)