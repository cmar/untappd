module Untappd
  class << self
    attr_accessor :configuration 

    def config
      self.configuration ||= Untappd::Configuration.new
    end
  
    def reset_configuration
      self.configuration = Untappd::Configuration.new
    end

    def configure
      yield(config)
    end
  end
end

module Untappd
  class Configuration
    attr_accessor :client_id, :client_secret, :base_uri, :gmt_offset

    def base_uri
      @base_uri || 'http://api.untappd.com/v4'
    end
  end
end