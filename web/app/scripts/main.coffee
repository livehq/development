'use strict'

root = (exports ? this)

components = root.components = './../bower_components/'

# This is a hack to clear up an error that shows up with angular.
root.window.scrollTo = ->
  false

require.config({
  paths: {
    config: 'config',
    angular: "#{components}angular/angular",
    domReady: "#{components}requirejs-domready/domReady",
    oauthJs: "#{components}oauth-js/oauth",
    loglevel: "#{components}loglevel/lib/loglevel",
    namespace: 'lib/namespace'
#    websocketRails: narwhaltalkLibs + 'websocket_rails',
#    jquery: narwhalComponents + 'jquery/jquery',
#    angularResource: narwhalComponents + 'angular-resource/angular-resource',
#    angularCookies: narwhalComponents + 'angular-cookies/angular-cookies',
#    angularSanitize: narwhalComponents + 'angular-sanitize/angular-sanitize',
#    jsdebugRails: narwhalComponents + 'jsdebug-rails/lib/generators/jsdebug/install/templates/jsdebug',
#    jqueryAtmosphere: camfireComponents + 'atmosphere-javascript/modules/jquery/src/main/webapp/jquery/jquery.atmosphere',
##    async: narwhalComponents + 'async/lib/async',
  },

  shim: {
#  'jquery': {},
#  'jqueryAtmosphere': {
#    deps: ['jquery']
#  },
##    'async': {}
  'namespace' : {},
  'config'    : {},
  'angular'   : {},
  'oauthJs'   : {},
  'loglevel'  : {},
#  'angularResource': {
#    deps: ['angular']
#  },
#  'angularCookies': {
#    deps: ['angular']
#  },
#  'angularSanitize': {
#    deps: ['angular']
#  },
#  'websocketRails': {},
#    'domReady': {}
  },

  deps: [
    './modules/oauthio/main',
    './modules/auth/main',
    './bootstrap'
  ]
});

require([
  'loglevel',
  './config',
  './config/configuration',
  './config/security',
  './config/routes',
  './controllers/main',
  './services/users_service'
  './services/initialization_service'

#  './services/configuration_service',

#  'services/services',
#  'services/socket_service',
#  'services/binding_service',
#  'services/dispatch_service',
#  'services/connectivity_service',
#  'services/user_service',
#
#  'controllers/controllers',
#  'controllers/connectivity_controller',
#  'controllers/user_controller',
#
#  'directives/directives',
##  "directives/bootstrap_modal_directive",
#
], ->)
