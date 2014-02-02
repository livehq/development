class Api::V1::AggregatesController < Api::V1::BaseController
  skip_authorization_check

  def all
    @all = {
        roles: User.valid_roles,
        links: Link.all,
    }
  end
end
