((root, factory) ->
  if typeof exports is "object" and exports
    module.exports = factory() # CommonJS
  else if typeof define is "function" and define.amd
    define factory # AMD (RequireJS and family)
  else
    root.cancanjs = factory() # Browser <script>
  return
) this, (->
  exports = {}
  exports.name = "cancanjs"
  exports.version = "0.1.0"

  filter = (list, func) -> x for x in list when func(x)
  abilities = undefined
  rules = undefined

  exports.loadAbilities = (data) ->
    abilities = data
    rules = abilities.rules

  exports.can = (action, subject) ->
    result = filter rules, (rule) ->
      actionMatch = action in rule.actions
      subjectMatch = (filter rule.subjects, (roleSubject) ->
        subject == roleSubject['model_name']
      ).length
      actionMatch && subjectMatch
    result.length > 0

  exports.cannot = (action, subject) ->
    !exports.can(action, subject)

  exports
)

@can = ->
  console.log('cancan can')
