define(['loglevel', './../app', './../modules/auth/services/roles_service'], (log) ->
  class InitializationService
    constructor: (@$http, @configuration, @rolesService) ->

    initSite: ->
      log.debug("Making request to: #{@configuration.api.allAggregateUrl}")
      @$http.get(@configuration.api.allAggregateUrl).success((response) =>
        @rolesService.roles = response.roles
      ).error((response) =>
        log.debug(response)
      )

  namespace 'streamCommander', (exports) ->
    exports.InitializationService = InitializationService
    exports.app.service 'initializationService', InitializationService
)