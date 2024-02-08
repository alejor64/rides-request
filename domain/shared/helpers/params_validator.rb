require 'json'

class ParamsValidator
  def self.validate(request_body, required_params)
    data = JSON.parse(request_body.read)
    
    missing_params = required_params - data.keys

    if missing_params.any?
      raise ArgumentError, "Missing params: #{missing_params.join(', ')}"
    end

    data
  end
end