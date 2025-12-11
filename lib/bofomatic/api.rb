require 'rest-client'
require 'json'

module BofOMatic
  class ApiV1
    def initialize(url:, apikey:)
      @url = url
      @apikey = apikey
    end

    def proposals
      response = RestClient.get "#{@url}/api/v1/proposals", { Authorization: "Bearer #{@apikey}" }
      proposals = {}
      JSON.parse(response).each do |id, proposal_hash|
        proposals[id.to_i] = Proposal.new(proposal_hash)
      end

      proposals
    end
  end
end
