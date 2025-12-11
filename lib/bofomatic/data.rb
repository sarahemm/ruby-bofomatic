module BofOMatic
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

  class Proposal < GenericData
    def initialize(proposal_hash)
      @data = proposal_hash.dup
      @data['interest'] = []
      proposal_hash['interest'].each do |id, interest|
        @data['interest'] << Interest.new(self, interest)
      end
    end
  end

  class Interest < GenericData
    def initialize(proposal, interest_hash)
      @proposal = proposal
      @data = interest_hash
    end
  end
end
