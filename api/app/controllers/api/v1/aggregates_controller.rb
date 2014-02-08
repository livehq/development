class Api::V1::AggregatesController < Api::V1::BaseController
  def all
    @all = Aggregate.all(current_user.ability)
    authorize! :read, Aggregate
  end
end
