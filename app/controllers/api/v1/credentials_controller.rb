class Api::V1::CredentialsController < Api::V1::BaseController
  # Token authentication
  before_filter :authenticate_user_from_token!
  # This is Devise's authentication
  before_filter :authenticate_user!

  def me
    @me = current_user
  end
end
