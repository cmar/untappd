module Untappd
  
  class User < Base
    
    def self.info(username, options={})
      options.merge!(auth_options)
      response_to_mash get("/user/info/#{username}", :query => options)
    end
    
    def self.badges(username, options={})
      options.merge!(auth_options)
      response_to_mash get("/user/badges/#{username}", :query => options)
    end
    
    def self.friends(username, options={})
      options.merge!(auth_options)
      response_to_mash get("/user/friends/#{username}", :query => options)
    end
    
    def self.wish_list(username, options={})
      options.merge!(auth_options)
      response_to_mash get("/user/wishlist/#{username}", :query => options)
    end
    
    def self.distinct(username, options={})
      options.merge!(auth_options)
      response_to_mash get("/user/beers/#{username}", :query => options)
    end
    
    # since (optional) - The numeric ID of the last recent check-in.
    # offset (optional) - The offset that you like the dataset to begin with.
    #   Each set returns 25 max records, so you can use that paginate the feed.
    def self.feed(username, options={})
      options.merge!(auth_options)
      response_to_mash get("/user/checkins/#{username}", :query => options)
    end
    
    # # since (optional) - The numeric ID of the last recent check-in.
    # # offset (optional) - The offset that you like the dataset to begin with.
    # #   Each set returns 25 max records, so you can use that paginate the feed.
    # def self.friend_feed(username, password, options={})
    #   options.merge!({
    #     :key => Untappd::apikey
    #   })

    #   response_to_mash get("/feed", :basic_auth => auth_hash(username, password),
    #                         :query => options)
    # end
    
  end
  
end
