module Untappd
  
  class Brewery < Base
    
    # since (optional) - The numeric ID of the last recent check-in.
    # offset (optional) - The offset that you like the dataset to begin with.
    #   Each set returns 25 max records, so you can use that paginate the feed.
    def self.feed(brewery_id, options={})
      options.merge!(auth_options)
      response_to_mash get("/brewery/checkins/#{brewery_id}", :query => options)
    end
    
    # This method will allow you to see extended information about a brewery.
    def self.info(brewery_id, options={})
      options.merge!(auth_options)
      response_to_mash get("/brewery/info/#{brewery_id}", :query => options)
    end
    
    def self.search(q, options={})
      options.merge!(auth_options)
      options.merge!({ :q => q })
      response_to_mash get("/search/brewery", :query => options)
    end
  end
  
end


