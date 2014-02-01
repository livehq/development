define(['./../modules/auth/services'], ->
  class UsersService extends auth.UsersService

  namespace 'auth', (exports) ->
    exports.module.service 'usersService', UsersService
)