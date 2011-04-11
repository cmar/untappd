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
    
    def self.feed(user, options={})
      options.merge!({
        :key => Untappd::apikey,
        :user => user
      })

      response_to_mash get("/user_feed", :query => options)
    end
  end
  
end
