module Untappd
  class Beer < Base
    # options:
    # * min_id (int, optional) - The numeric ID of the most recent check-in. This is provided to
    # you in the next_query attribute.
    # * max_id (int, optional) - The checkin ID that you want the results to start with
    # * limit (int, optional) - The number of results to return, maximum of 50, default is 25
    def self.feed(beer_id, options={})
      options.merge!(auth_options)
      response = response_to_mash get("/beer/checkins/#{beer_id}", :query => options)
    end

    def self.info(beer_id, options={})
      options.merge!(auth_options)
      response_to_mash get("/beer/info/#{beer_id}", :query => options)
    end

    # options:
    # * sort (optional): "count" or "name" (default) - This can let you choose if you want the
    # results to be returned in Alphabetical order (name) or by checkin count (count). By default
    # the search returns all values in Alphabetical order.
    def self.search(q, options={})
      options.merge!(auth_options)
      options.merge!({ :q => q })
      response_to_mash get("/search/beer/", :query => options)
    end

    def self.trending
      response_to_mash get("/beer/trending", :query => auth_options)
    end
  end
end
