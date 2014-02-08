class Api::V1::CredentialsController < Api::V1::BaseController
  #load_and_authorize_resource

  def me
    @me = current_user
  end
end
