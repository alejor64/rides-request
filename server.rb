require 'sinatra'
require 'dotenv/load'

require_relative 'controllers/base_controller'
require_relative 'controllers/cards_controller'
require_relative 'controllers/rides_controller'

class MyApp < Sinatra::Base
  use RidesController
  use CardsController

  # Otras configuraciones de Sinatra
  run! if app_file == $0
end