module Untappd
  class Venue < Base
    
    # since (optional) - The numeric ID of the last recent check-in.
    # offset (optional) - The offset that you like the dataset to begin with.
    #   Each set returns 25 max records, so you can use that paginate the feed.
    def self.feed(venue_id, options={})
      options.merge!(auth_options)
      response_to_mash get("/venue/checkins/#{venue_id}", :query => options)
    end

    def self.info(venue_id, options={})
      options.merge!(auth_options)
      response_to_mash get("/venue/info/#{venue_id}", :query => options)
    end
  end
end
