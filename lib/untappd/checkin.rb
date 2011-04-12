module Untappd
  
  class Checkin < Base
    
    def self.info(checkin_id, options={})
      options.merge!({
        :key => Untappd::apikey,
        :id => checkin_id
      })

      response_to_mash get("/details", :query => options)
    end
    
    # since (optional) - The numeric ID of the last recent check-in. This provided to you in the next_query attribute.
    # geolat (optional) - The numeric Latitude to filter the public feed.
    # geolng (optional) - The numeric Longitude to filter the public feed.
    # offset (optional) - The offset that you like the dataset to begin with.
    #    Each set returns 25 max records, so you can use that paginate the feed.
    def self.feed(options={})
      options.merge!({
        :key => Untappd::apikey
      })

      response_to_mash get("/thepub", :query => options)
    end
    
  end
  
end


