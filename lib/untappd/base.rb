require 'httparty'
require 'hashie'
require 'digest/md5'

module Untappd

  class Base
    include HTTParty
    base_uri Untappd.config.base_uri
    format :json

    def self.response_to_mash(response)
      if response.code == 200
        Hashie::Mash.new(response).response
      else
        Hashie::Mash.new {}
      end
    end

    def self.auth_options
      {
        :client_id => Untappd.config.client_id,
        :client_secret => Untappd.config.client_secret
      }
    end
  end

end