(function() {
  var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  (function(root, factory) {
    if (typeof exports === "object" && exports) {
      module.exports = factory();
    } else if (typeof define === "function" && define.amd) {
      define(factory);
    } else {
      root.cancanjs = factory();
    }
  })(this, (function() {
    var abilities, exports, filter, rules;
    exports = {};
    exports.name = "cancanjs";
    exports.version = "0.1.0";
    filter = function(list, func) {
      var x, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = list.length; _i < _len; _i++) {
        x = list[_i];
        if (func(x)) {
          _results.push(x);
        }
      }
      return _results;
    };
    abilities = void 0;
    rules = void 0;
    exports.loadAbilities = function(data) {
      abilities = data;
      return rules = abilities.rules;
    };
    exports.can = function(action, subject) {
      var result;
      result = filter(rules, function(rule) {
        var actionMatch, subjectMatch;
        actionMatch = __indexOf.call(rule.actions, action) >= 0;
        subjectMatch = (filter(rule.subjects, function(roleSubject) {
          return subject === roleSubject['model_name'];
        })).length;
        return actionMatch && subjectMatch;
      });
      return result.length > 0;
    };
    exports.cannot = function(action, subject) {
      return !exports.can(action, subject);
    };
    return exports;
  }));

  this.can = function() {
    return console.log('cancan can');
  };

}).call(this);
