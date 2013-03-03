module Untappd
  class Checkin < Base
    def self.info(checkin_id)
      response_to_mash get("/checkin/view/#{checkin_id}", :query => auth_options)
    end

    # options:
    # * min_id (int, optional) - The numeric ID of the most recent check-in.
    # * max_id (int, optional) - The checkin ID that you want the results to start with
    # * limit (int, optional) - The number of results to return, max of 50, default is 25
    def self.feed(options={})
      options.merge!(auth_options)
      response_to_mash get("/thepub", :query => options)
    end

    # options:
    # * min_id (int, optional) - The numeric ID of the most recent check-in.
    # * lng (float, optional) - The numeric Latitude to filter the public feed.
    # * lat (float, optional) - The numeric Longitude to filter the public feed.
    # * radius (int, optional) - The max radius you would like the check-ins to start within
    # * max_id (int, optional) - The checkin ID that you want the results to start with
    # * limit (int, optional) - The number of results to return, max of 50, default is 25
    def self.local_feed(lng, lat, radius, options={})
      options.merge!(auth_options)
      options.merge!({
        :lng      => lng,
        :lat      => lat,
        :radius   => radius
      })

      response_to_mash get("/thepub/local", :query => options)
    end

    # options:
    # * foursquare_id (optional) - The MD5 hash ID of the Venue you want to attach the beer
    # checkin. This HAS TO BE the MD5 non-numeric hash from the foursquare v2.
    # * timezone - user timezone, defaults to 'PST'
    # * gmt_offset - calculated from the timezone, but you may override
    # * geolat (optional) - The numeric Latitude of the user. This is required if you add a location.
    # * geolng (optional) - The numeric Longitude of the user. This is required if you add a location.
    # * shout (optional) - The text you would like to include as a comment of the checkin.
    # Max of 140 characters.
    # * rating (optional) - The rating score you would like to add for the beer. This can only
    # be 1 to 5 and whole numbers (no 4.2)
    # * facebook (optional) - Default = "off", Pass "on" to post to facebook
    # * twitter (optional) - Default = "off", Pass "on" to post to twitter
    # * foursquare (optional) - Default = "off", Pass "on" to checkin on foursquare
    def self.create(access_token, beer_id, options={})
      timezone = options.fetch(:timezone, 'PST')
      gmt_offset = options.fetch(:gmt_offset, Time.zone_offset(timezone))

      options.merge!({
        :timezone     => timezone,
        :gmt_offset   => gmt_offset,
        :bid          => beer_id
      })

      response_to_mash post("/checkin/add",
        :query => {:access_token => access_token},
        :body => options
      )
    end

    def self.add_comment(access_token, checkin_id, comment)
      response_to_mash post("/checkin/addcomment/#{checkin_id}",
        :query => { :access_token => access_token },
        :body => { :comment => comment }
      )
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


