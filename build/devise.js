(function() {
  (function(root, factory) {
    if (typeof exports === "object" && exports) {
      module.exports = factory();
    } else if (typeof define === "function" && define.amd) {
      define(factory);
    } else {
      root.devisejs = factory();
    }
  })(this, (function() {
    var User, buildRoles, exports, _currentUser, _roles;
    exports = {};
    exports.name = "devisejs";
    exports.version = "0.1.0";
    _roles = void 0;
    _currentUser = void 0;
    buildRoles = function(roles) {
      var bitMask, intCode, role, userRoles;
      bitMask = "01";
      userRoles = {};
      for (role in roles) {
        intCode = parseInt(bitMask, 2);
        userRoles[roles[role]] = {
          bitMask: intCode,
          title: roles[role]
        };
        bitMask = (intCode << 1).toString(2);
      }
      return userRoles;
    };
    User = (function() {
      function User(email, rolesMask) {
        this.email = email;
        this.rolesMask = rolesMask;
      }

      User.prototype.isRole = function(role) {
        var r, roleBitMask, usersRolesMask;
        r = exports.roles()[role];
        if (r === void 0) {
          return false;
        }
        roleBitMask = r.bitMask;
        usersRolesMask = exports.currentUser().rolesMask;
        return (roleBitMask & usersRolesMask) === roleBitMask;
      };

      return User;

    })();
    exports.currentUser = function() {
      return _currentUser;
    };
    exports.roles = function() {
      return _roles;
    };
    exports.loadCurrentUser = function(data) {
      return _currentUser = new User(data.email, data.roles_mask);
    };
    exports.loadRoles = function(roles) {
      return _roles = buildRoles(roles);
    };
    return exports;
  }));

}).call(this);
