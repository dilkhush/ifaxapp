require 'rest-client'

API_URL = "https://api.ifaxapp.com/v1/customer/"

module IfaxappApi
  class Fax
    def initialize(client)
      @client = client
    end

    # Send Params
    # params = {
    #   "faxNumber" : "+12345678901",
    #   "faxData" : [{
    #         "fileName" : "abc.pdf",
    #         "fileUrl" : "HTTP url of file"
    #       },
    #       {
    #         "fileName" : "xyz.pdf",
    #         "fileUrl" : "HTTP url of file"
    #   }]
    # }
    def send(params: {}, url: 'fax-send')
      url = API_URL + url
      headers = default_headers.merge('accessToken' => @client.api_key)
      send_request(url, params, headers)
    end


    # Resend Fax Params
    # {
    #   "jobId" : 12345
    # }
    def resend(params: {}, url: 'fax-resend')
      url = API_URL + url
      headers = default_headers.merge('accessToken' => @client.api_key)
      send_request(url, params, headers)
    end

    # Fax Status Params
    # {
    #   "jobId" : 12345
    # }    
    def status(params: {}, url: 'fax-status')
      url = API_URL + url
      headers = default_headers.merge('accessToken' => @client.api_key)
      send_request(url, params, headers)
    end

    def send_request(url, data, headers, method = 'post')
      begin
        if method == 'post'
          response = RestClient.post(url, data.to_json, headers)
        end
      rescue RestClient::ExceptionWithResponse => e
        return { error: e.response.body }
      end
      response.body
    end

    def default_headers
      {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
    end
  end
end