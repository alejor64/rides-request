require_relative 'base_controller'

class RidesController < Sinatra::Base
  before do
    content_type :json
  end

  get '/' do
    {msg: 'Hello'}.to_json
  end
end