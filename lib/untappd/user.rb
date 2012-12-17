module Untappd
  class User < Base
    # options:
    # * max_id (int, optional) - The checkin ID that you want the results to start with
    # * limit (int, optional) - The number of results to return, max of 50, default is 25
    def self.feed(username, options={})
      options.merge!(auth_options)
      response_to_mash get("/user/checkins/#{username}", :query => options)
    end

    def self.info(username)
      response_to_mash get("/user/info/#{username}", :query => auth_options)
    end

    # options:
    # * offset (int, optional) - The numeric offset that you what results to start
    def self.badges(username, options={})
      options.merge!(auth_options)
      response_to_mash get("/user/badges/#{username}", :query => options)
    end

    # options:
    # * offset (int, optional) - The numeric offset that you what results to start
    # limit (optional) - The number of records that you will return (max 50)
    def self.friends(username, options={})
      options.merge!(auth_options)
      response_to_mash get("/user/friends/#{username}", :query => options)
    end

    # options:
    # * offset (int, optional) - The numeric offset that you what results to start
    def self.wish_list(username, options={})
      options.merge!(auth_options)
      response_to_mash get("/user/wishlist/#{username}", :query => options)
    end

    # options:
    # * sort (string, optional) - Your can sort the results using these values:
    # date - sorts by date (default), checkin - sorted by highest checkin,
    # global_rating - sorts by global rating, user_rating - sorted by the user's rating
    # * offset (int, optional) - The numeric offset that you what results to start
    def self.distinct(username, options={})
      options.merge!(auth_options)
      response_to_mash get("/user/beers/#{username}", :query => options)
    end

    # options:
    # * max_id (int, optional) - The checkin ID that you want the results to start with
    # * limit (int, optional) - The number of results to return, max of 50, default is 25
    def self.friend_feed(access_token, options={})
      options.merge!({:access_token => access_token})
      response_to_mash get("/checkin/recent", :query => options)
    end
  end
end
