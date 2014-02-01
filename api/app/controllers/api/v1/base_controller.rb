class Api::V1::BaseController < ApplicationController
  respond_to :json

  #rescue_from ActionController::ParameterMissing, with: :missing_parameter
end
