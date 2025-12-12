module BofOMatic
  class GenericCollection
    include Enumerable

    def [](id)
      @data[id]
    end

    def each
      @data.each do |id, datum|
        yield datum
      end
    end

    def is_empty?
      @data == {}
    end
  end

  class GenericData
    def method_missing(key)
      super unless @data.include? key.to_s
      if(key.end_with? '_at' or key.end_with? '_time') then
        Time.new(@data[key.to_s])
      else
        @data[key.to_s]
      end
    end
  end

  class Proposals < GenericCollection
    def initialize(api)
      @api = api

      response = @api.api_get("proposals")

      @data = {}
      response.each do |id, proposal_hash|
        @data[id.to_i] = Proposal.new(@api, proposal_hash)
      end
    end
  end

  class Proposal < GenericData
    def initialize(api, proposal_hash)
      @api = api
      @data = proposal_hash
    end

    def interests
      Interests.new @api, self
    end
  end

  class Interests < GenericCollection
    def initialize(api, proposal)
      @api = api
      @proposal = proposal

      response = @api.api_get("proposals/#{proposal.id}/interests")

      @data = {}
      response.each do |id, interest_hash|
        @data[id.to_i] = Interest.new(self, proposal, interest_hash)
      end
    end
  end

  class Interest < GenericData
    def initialize(api, proposal, interest_hash)
      @api = api
      @proposal = proposal
      @data = interest_hash
    end
  end
end
