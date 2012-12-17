module Untappd
  class Venue < Base
    # options:
    # * min_id (int, optional) - The numeric ID of the most recent check-in. New results
    # will only be shown if there are checkins before this ID
    # * max_Id (int, optional) - The checkin ID that you want the results to start with
    # * limit (int, optional) - The number of results to return, max of 50, default is 25
    def self.feed(venue_id, options={})
      options.merge!(auth_options)
      response_to_mash get("/venue/checkins/#{venue_id}", :query => options)
    end

    def self.info(venue_id)
      response_to_mash get("/venue/info/#{venue_id}", :query => auth_options)
    end
  end
end
