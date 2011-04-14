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
   
    # foursquare_id (optional) - The MD5 hash ID of the Venue you want to attach 
    #        the beer checkin. This HAS TO BE the MD5 non-numeric hash from the foursquare v2. Older numeric id will not be accepted.
    # user_lat (optional) - The numeric Latitude of the user. This is required if you add a location.
    # user_lng (optional) - The numeric Longitude of the user. This is required if you add a location.
    # shout (optional) - The text you would like to include as a comment of the checkin. Max of 140 characters.
    # facebook (optional) - Default = "off", Pass "on" to post to facebook
    # twitter (optional) - Default = "off", Pass "on" to post to twitter
    # foursquare (optional) - Default = "off", Pass "on" to checkin on foursquare
    def self.create(username, password, beer_id, options={})
      
      options.merge!({
        :gmt_offset => Untappd::gmt_offset,
        :bid => beer_id
      })
      
      response = post("/checkin", :query => { :key => Untappd::apikey },
            :body => options, :basic_auth => auth_hash(username, password))
            
      Hashie::Mash.new(response)
    end
    
    # foursquare_id (optional) - The MD5 hash ID of the Venue you want to attach the beer checkin.
    #       This HAS TO BE the MD5 non-numeric hash from the foursquare v2. Older numeric id will not be accepted.
    # user_lat (optional) - The numeric Latitude of the user. This is required if you add a location.
    # user_lng (optional) - The numeric Longitude of the user. This is required if you add a location.
    def self.test(username, password, beer_id, options={})
      options.merge!({
        :gmt_offset => Untappd::gmt_offset,
        :bid => beer_id 
      })
      
      response = post("/checkin_test", :query => { :key => Untappd::apikey },
            :body => options, :basic_auth => auth_hash(username, password))
      
      Hashie::Mash.new(response)
    end
    
    #
    def self.add_comment(username, password, checkin_id, comment, options={})
      options.merge!({
        :checkin_id => checkin_id,
        :comment => comment 
      })
      
      response_to_mash post("/add_comment", :query => { :key => Untappd::apikey },
            :body => options, :basic_auth => auth_hash(username, password))
    end
    
    #
    def self.remove_comment(username, password, comment_id, options={})
      options.merge!({
        :comment_id => comment_id
      })
      
      response_to_mash post("/delete_comment", :query => { :key => Untappd::apikey },
            :body => options, :basic_auth => auth_hash(username, password))
    end
    
    #
    def self.toast(username, password, checkin_id, options={})
      options.merge!({
        :checkin_id => checkin_id
      })
      
      response_to_mash post("/toast", :query => { :key => Untappd::apikey },
            :body => options, :basic_auth => auth_hash(username, password))
    end
    
    #
    def self.untoast(username, password, checkin_id, options={})
      options.merge!({
        :checkin_id => checkin_id
      })
      
      response_to_mash post("/delete_toast", :query => { :key => Untappd::apikey },
            :body => options, :basic_auth => auth_hash(username, password))
    end
      
  end
  
end


