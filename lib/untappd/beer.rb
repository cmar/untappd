module Untappd
  
  class Beer < Base
    
    # since (optional) - The numeric ID of the last recent check-in. This provided to you in the next_query attribute.
    # offset (optional) - The offset that you like the dataset to begin with. 
    # Each set returns 25 max records, so you can use that paginate the feed.
    def self.checkins(beer_id, options={})
      options.merge!({
        :key => Untappd::apikey,
        :bid => beer_id
      })

      response_to_mash get("/beer_checkins", :query => options)
    end
    
    #
    def self.info(beer_id, options={})
      options.merge!({
        :key => Untappd::apikey,
        :bid => beer_id
      })

      response_to_mash get("/beer_info", :query => options)
    end
    
    # offset (optional) - The offset that you like the dataset to 
    # begin with. Each set returns 25 max records, so you can use that paginate the results.
    # sort (optional): "count" or "name" (default) - This can let you choose if you
    # want the results to be returned in Alphabetical order (name) or by 
    # checkin count (count). By default the search returns all values in Alphabetical order.
    def self.search(q, options={})
      options.merge!({
        :key => Untappd::apikey,
        :q => q
      })

      response_to_mash get("/beer_search", :query => options)
    end
    
    # type (optional) - 4 options: "all", "macro", "micro", "local". "All" is set to default.
    # limit (optional) - The number of records that you will return (max 10)
    # age (optional) - 3 options: "daily", "weekly", "monthly".
    # geolat (optional) - The numeric Latitude to filter the public feed. This is required for local "type".
    # geolng (optional) - The numeric Longitude to filter the public feed. This is required for local "type".
    def self.trending(options={})
      options.merge!({
        :key => Untappd::apikey
      })

      response_to_mash get("/trending", :query => options)
    end
    
  end
  
end
