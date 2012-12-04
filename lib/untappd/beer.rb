module Untappd

  class Beer < Base

    # since (optional) - The numeric ID of the last recent check-in. This provided to you in the next_query attribute.
    # offset (optional) - The offset that you like the dataset to begin with.
    # Each set returns 25 max records, so you can use that paginate the feed.
    def self.feed(beer_id, options={})
      options.merge!(auth_options)
      response = response_to_mash get("/beer/checkins/#{beer_id}", :query => options)
    end

    def self.info(beer_id, options={})
      options.merge!(auth_options)
      response_to_mash get("/beer/info/#{beer_id}", :query => options)
    end

    # offset (optional) - The offset that you like the dataset to
    # begin with. Each set returns 25 max records, so you can use that paginate the results.
    # sort (optional): "count" or "name" (default) - This can let you choose if you
    # want the results to be returned in Alphabetical order (name) or by
    # checkin count (count). By default the search returns all values in Alphabetical order.
    def self.search(q, options={})
      options.merge!(auth_options)
      options.merge!({ :q => q })
      response_to_mash get("/search/beer/", :query => options)
    end

    # type (optional) - 4 options: "all", "macro", "micro", "local". "All" is set to default.
    # limit (optional) - The number of records that you will return (max 10)
    # age (optional) - 3 options: "daily", "weekly", "monthly".
    # geolat (optional) - The numeric Latitude to filter the public feed. This is required for local "type".
    # geolng (optional) - The numeric Longitude to filter the public feed. This is required for local "type".
    def self.trending(options={})
      options.merge!(auth_options)
      response_to_mash get("/beer/trending", :query => options)
    end

  end

end
