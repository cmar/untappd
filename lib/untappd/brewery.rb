module Untappd
  
  class Brewery < Base
    
    # since (optional) - The numeric ID of the last recent check-in.
    # offset (optional) - The offset that you like the dataset to begin with.
    #   Each set returns 25 max records, so you can use that paginate the feed.
    def self.feed(brewery_id, options={})
      options.merge!({
        :key => Untappd::apikey,
        :brewery_id => brewery_id
      })

      response_to_mash get("/brewery_checkins", :query => options)
    end
    
    # This method will allow you to see extended information about a brewery.
    def self.info(brewery_id, options={})
      options.merge!({
        :key => Untappd::apikey,
        :brewery_id => brewery_id
      })

      response_to_mash get("/brewery_info", :query => options)
    end
    
    #
    def self.search(q, options={})
      options.merge!({
        :key => Untappd::apikey,
        :q => q
      })

      response_to_mash get("/brewery_search", :query => options)
    end
    
  end
  
end


