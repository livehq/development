define(['./../modules/auth/services/users_service'], ->
  class UsersService extends auth.UsersService

  namespace 'auth', (exports) ->
    exports.module.service 'usersService', UsersService
)