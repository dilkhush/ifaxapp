require_relative "fax"

API_URL = "https://api.ifaxapp.com/v1/customer/"

module IfaxappApi
  class Client

    attr_reader :api_key, :base_url

    def initialize(api_key: )
      @api_key = api_key
      @base_url = API_URL
    end

    def fax(params = {})
      @fax ||= Fax.new(self)
    end
  end
end