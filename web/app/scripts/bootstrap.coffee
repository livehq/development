define(
  [
    'require',
    'namespace',
    'app'
  ],
(require) ->
  require(['domReady!', 'loglevel'], (document, log) ->
    # Bootstrap the application on the dom is ready
    $injector = angular.bootstrap(document, ['webApp'])

    configuration = $injector.get('configuration')
    log.setLevel(configuration.log.level)

    initializationService = $injector.get('initializationService')
    initializationService.initSite()
  )
)