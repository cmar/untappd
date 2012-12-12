module Untappd
  class OAuth < Base
    def self.authenticate_url
      raise "redirect_url not configured" unless Untappd.config.redirect_url

      "https://untappd.com/oauth/authenticate/?client_id=#{Untappd.config.client_id}&response_type=token&redirect_url=#{Untappd.config.redirect_url}"
    end
  end
end