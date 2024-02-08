require 'sinatra/base'
require 'json'
require 'byebug'
require_relative '../domain/shared/helpers/params_validator'

class BaseController < Sinatra::Base
  before do
    content_type :json
  end

  def validate_params(required_params)
    ParamsValidator.validate(request.body, required_params)
  end

  private

  def handle_error(status, error)
    status(status)
    { error: error.message }.to_json
  end
end