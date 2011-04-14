module Untappd
  
  class User < Base
    
    def self.info(user, options={})
      options.merge!({
        :key => Untappd::apikey,
        :user => user
      })

      response_to_mash get("/user", :query => options)
    end
    
    def self.badges(user, options={})
      options.merge!({
        :key => Untappd::apikey,
        :user => user
      })

      response_to_mash get("/user_badge", :query => options)
    end
    
    def self.friends(user, options={})
      options.merge!({
        :key => Untappd::apikey,
        :user => user
      })

      response_to_mash get("/friends", :query => options)
    end
    
    def self.wish_list(user, options={})
      options.merge!({
        :key => Untappd::apikey,
        :user => user
      })

      response_to_mash get("/wish_list", :query => options)
    end
    
    def self.distinct(user, options={})
      options.merge!({
        :key => Untappd::apikey,
        :user => user
      })

      response_to_mash get("/distinct", :query => options)
    end
    
    # since (optional) - The numeric ID of the last recent check-in.
    # offset (optional) - The offset that you like the dataset to begin with.
    #   Each set returns 25 max records, so you can use that paginate the feed.
    def self.feed(user, options={})
      options.merge!({
        :key => Untappd::apikey,
        :user => user
      })

      response_to_mash get("/user_feed", :query => options)
    end
    
    # since (optional) - The numeric ID of the last recent check-in.
    # offset (optional) - The offset that you like the dataset to begin with.
    #   Each set returns 25 max records, so you can use that paginate the feed.
    def self.friend_feed(username, password, options={})
      options.merge!({
        :key => Untappd::apikey
      })

      response_to_mash get("/feed", :basic_auth => auth_hash(username, password),
                            :query => options)
    end
    
  end
  
end
