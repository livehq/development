$injector = angular.bootstrap(document, ['webApp'])
configuration = $injector.get('configuration')

log.setLevel(configuration.log.level)

initializationService = $injector.get('initializationService')
initializationService.initSite()
