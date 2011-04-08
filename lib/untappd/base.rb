require 'httparty'
require 'hashie'

module Untappd
  
  class Base
    include HTTParty
    base_uri 'http://api.untappd.com/v3'
    format :json
    
    def self.response_to_mash(response)
      if response.code == 200
        Hashie::Mash.new(response).results
      else
        Hashie::Mash.new {}
      end
    end
  end
  
end