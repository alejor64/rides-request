require 'jwt'
require 'dotenv/load'

class CardService
  SECRET_KEY = ENV['SECRET_KEY']
  ALGORITHM = ENV['ALGORITHM']

  def self.tokenize_card(card_data)
    jwt_token = JWT.encode(card_data, SECRET_KEY, ALGORITHM)
    jwt_token
  end

  def self.decode_token(jwt_token)
    decoded_data = JWT.decode(jwt_token, SECRET_KEY, true, algorithm: ALGORITHM).first
    decoded_data
  rescue JWT::DecodeError => e
    { error: "Error al decodificar el token: #{e.message}" }.to_json
  end
end