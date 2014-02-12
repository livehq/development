((root, factory) ->
  if typeof exports is "object" and exports
    module.exports = factory() # CommonJS
  else if typeof define is "function" and define.amd
    define factory # AMD (RequireJS and family)
  else
    root.devisejs = factory() # Browser <script>
  return
) this, (->
  exports = {}
  exports.name = "devisejs"
  exports.version = "0.1.0"

  _roles = undefined
  _currentUser = undefined

  buildRoles = (roles) ->
    bitMask = "01"
    userRoles = {}
    for role of roles
      intCode = parseInt(bitMask, 2)
      userRoles[roles[role]] =
        bitMask: intCode
        title: roles[role]

      bitMask = (intCode << 1).toString(2)
    userRoles

  class User
    constructor: (@email, @rolesMask)->

    isRole: (role) ->
      r = exports.roles()[role]
      return false if (r == undefined)
      roleBitMask = r.bitMask
      usersRolesMask = exports.currentUser().rolesMask
      (roleBitMask & usersRolesMask) == roleBitMask

  exports.currentUser = ->
    _currentUser

  exports.roles = ->
    _roles

  exports.loadCurrentUser = (data) ->
    _currentUser = new User(data.email, data.roles_mask)

  exports.loadRoles = (roles) ->
    _roles = buildRoles(roles)

  exports
)
