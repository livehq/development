define(
  [
    'require',
    'namespace',
#    'config',
#    'config/development',
    'app'
  ],
(require) ->
  require(['domReady!'], (document) ->
    angular.bootstrap(document, ['webApp'])
  )
)