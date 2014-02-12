#    './modules/oauthio/main',
#    './modules/angular-cancan',
#    './modules/auth/main',

require('./app')
#  './config',
require('./config/configuration')
require('./config/security')
require('./config/routes')


# Controllers
require('./controllers/main')
#require('./services/users_service')
require('./services/initialization_service')
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
#  "directives/bootstrap_modal_directive",

require('./bootstrap')
