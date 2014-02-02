define(['./../module'], ->
  class UsersService
    constructor: ($http) ->

    getAll: (success, error) ->
      $http.get("/users").success(success).error error

  namespace 'auth', (exports) ->
    exports.UsersService = UsersService
    exports.module.service 'Users', UsersService
)