require_relative 'base_controller'
require_relative '../domain/card/service/card_service'

class CardsController < BaseController
  # Simulate card tokenize
  post '/agregar_tarjeta' do
    data = validate_params(['card_number', 'name', 'expiration_date', 'cvv'])
    data.delete('cvv')
    token = CardService.tokenize_card(data)
    {
      msg: 'Card added successfully',
      token: token
    }.to_json
  rescue ArgumentError => e
    handle_error(404, e)
  rescue => e
    handle_error(500, e)
  end
end