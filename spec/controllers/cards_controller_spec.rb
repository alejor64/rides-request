require 'rack/test'
require 'faker'
require_relative '../../controllers/cards_controller'

describe CardsController do
  include Rack::Test::Methods

  def app
    CardsController
  end

  context 'POST /agregar_tarjeta' do
    it 'Should return card added successfully and token' do
      card_data = {
        card_number: Faker::Business.credit_card_number,
        name: Faker::Name.name,
        expiration_date: Faker::Business.credit_card_expiry_date.strftime('%m%y'),
        cvv: Faker::Number.number(digits: 3)
      }

      post '/agregar_tarjeta', card_data.to_json, 'CONTENT_TYPE' => 'application/json'
      response_body = JSON.parse(last_response.body)

      expect(response_body['msg'].nil?).to eq(false)
      expect(response_body).to have_key('token')
    end

    it 'Shpuld return error with missing params' do
      card_data = {
        card_number: Faker::Business.credit_card_number,
        name: Faker::Name.name,
        expiration_date: Faker::Business.credit_card_expiry_date.strftime('%m%y')
      }

      post '/agregar_tarjeta', card_data.to_json, { 'CONTENT_TYPE' => 'application/json' }

      expect(last_response.status).to eq(404)
      response_body = JSON.parse(last_response.body)
      expect(response_body['error'].nil?).to eq(false)
    end
  end
end