require 'factory_girl_rails'

def create_seed(model, id, instance, associations={})

  model.seed do |s|
    map_attributes(instance, s)
    map_attributes(associations, s)
    s.id = id
  end
end

def map_attributes(from, to)
  def _map_attributes(_from, _to)
    _from.each do |k, v|
      _to.send("#{k}=", v)
    end
  end

  def _map_attributes2(_from, _to)
    _from.each do |k, v|
      _to.send("#{k}=", v)
    end
  end

  if from.respond_to? 'attributes'
    _map_attributes(from.attributes, to)
  else
    _map_attributes2(from, to)
  end
end
