require 'httparty'
require 'hashie'
require 'digest/md5'

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
  
    def self.auth_hash(username, password)
      {:username => username, 
       :password => Digest::MD5.hexdigest(password)}
    end
  end
  
end