class UsersService extends auth.UsersService

namespace 'auth', (exports) ->
  exports.module.service 'usersService', UsersService
