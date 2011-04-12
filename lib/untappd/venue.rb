module Untappd
  
  class Venue < Base
    
    # since (optional) - The numeric ID of the last recent check-in.
    # offset (optional) - The offset that you like the dataset to begin with.
    #   Each set returns 25 max records, so you can use that paginate the feed.
    def self.feed(venue_id, options={})
      options.merge!({
        :key => Untappd::apikey,
        :venue_id => venue_id
      })

      response_to_mash get("/venue_checkins", :query => options)
    end
    
    #
    def self.info(venue_id, options={})
      options.merge!({
        :key => Untappd::apikey,
        :venue_id => venue_id
      })

      response_to_mash get("/venue_info", :query => options)
    end
    
  end
  
end
