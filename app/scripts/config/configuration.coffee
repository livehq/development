define(['./../app', './environments/development', './environments/production'], ->
  streamCommander.app.config((ENV, $provide) ->
    configuration = switch ENV
      when 'development' then new streamCommander.DevelopmentConfiguration
      when 'production' then new streamCommander.ProductionConfiguration
      else throw Error("Could not load configuration service!")

    $provide.constant('configuration', configuration);
  )
)