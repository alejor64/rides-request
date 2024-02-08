require 'rack/test'
require 'faker'
require_relative '../../controllers/rides_controller'

describe RidesController do
  include Rack::Test::Methods

  def app
    RidesController
  end

  context 'POST /solicitar_viaje' do
    it 'should return ride requested and started successfully' do
      ride_params = {
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        destination_latitude: Faker::Address.latitude,
        destination_longitude: Faker::Address.longitude,
        vehicle_type: 'sedan',
        passenger_count: 3,
        special_requests: 'No special requests'
      }

      post '/solicitar_viaje', ride_params.to_json, { 'CONTENT_TYPE' => 'application/json' }
      response_body = JSON.parse(last_response.body)

      expect(response_body['msg']).to eq('Ride requested and started successfully')
      expect(response_body).to have_key('ride_id')
      expect(response_body['driver_name'].nil?).to eq(false)
    end

    it 'Should return error with missing params' do
      ride_data = {
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        destination_latitude: Faker::Address.latitude,
        destination_longitude: Faker::Address.longitude,
        vehicle_type: 'Sedan'
      }

      post '/solicitar_viaje', ride_data.to_json, { 'CONTENT_TYPE' => 'application/json' }

      expect(last_response.status).to eq(404)
      response_body = JSON.parse(last_response.body)
      expect(response_body['error']).not_to be_nil
    end
  end
end