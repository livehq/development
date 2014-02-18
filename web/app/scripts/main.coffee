#    './modules/oauthio/main',
#    './modules/angular-cancan',
#    './modules/auth/main',

require('./app')
require('./config/configuration')
require('./config/security')
require('./config/routes')

# Controllers
require('./controllers/home_controller')
require('./controllers/login_controller')
require('./controllers/head_panel_controller')

# Services
require('./services/current_user_service')
require('./services/initialization_service')

# Directives

# Bootstrap
require('./bootstrap')

#  './config',
#require('./services/users_service')
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

