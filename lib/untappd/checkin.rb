module Untappd

  class Checkin < Base

    def self.info(checkin_id, options={})
      options.merge!(auth_options)
      response_to_mash get("/checkin/view/#{checkin_id}", :query => options)
    end

    # since (optional) - The numeric ID of the last recent check-in. This provided to you in the next_query attribute.
    # geolat (optional) - The numeric Latitude to filter the public feed.
    # geolng (optional) - The numeric Longitude to filter the public feed.
    # offset (optional) - The offset that you like the dataset to begin with.
    #    Each set returns 25 max records, so you can use that paginate the feed.
    def self.feed(options={})
      options.merge!(auth_options)
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
    def self.create(access_token, gmt_offset, timezone, beer_id, options={})
      options.merge!({
        :gmt_offset   => gmt_offset,
        :timezone     => timezone,
        :bid          => beer_id
      })

      response_to_mash post("/checkin/add", :query => {:access_token => access_token}, :body => options)
    end

    def self.add_comment(access_token, checkin_id, comment)
      query_params = { :access_token => access_token }
      body_params = { :comment => comment }
      response_to_mash post("/checkin/addcomment/#{checkin_id}", :query => query_params, :body => body_params)
    end

    def self.remove_comment(access_token, comment_id)
      params = { :access_token => access_token }
      response_to_mash post("/checkin/deletecomment/#{comment_id}", :query => params)
    end

    def self.toggle_toast(access_token, checkin_id)
      params = { :access_token => access_token }
      response_to_mash post("/checkin/toast/#{checkin_id}", :query => params)
    end
  end

end


