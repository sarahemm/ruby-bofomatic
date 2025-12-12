require 'rest-client'
require 'json'

module BofOMatic
  class ApiV1
    def initialize(url:, apikey:)
      @url = url
      @apikey = apikey
    end

    def api_get(path_fragment)
      response = RestClient.get "#{@url}/api/v1/#{path_fragment}", { Authorization: "Bearer #{@apikey}" }
      # TODO: error handling
      JSON.parse(response)
    end

    def proposals
      Proposals.new(self)
    end
  end
end
