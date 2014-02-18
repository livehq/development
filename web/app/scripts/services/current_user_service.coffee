devise = require('devisejs')

class CurrentUserService extends devise.User
  constructor: () ->

namespace 'streamCommander', (exports) ->
  exports.CurrentUserService = CurrentUserService
  exports.app.service 'currentUser', CurrentUserService