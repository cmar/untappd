module Untappd
  class Brewery < Base
    # options:
    # * min_id (int, optional) - The numeric ID of the most recent check-in. New results
    # will only be shown if there are checkins before this ID
    # * max_id (int, optional) - The checkin ID that you want the results to start with
    # * limit (int, optional) - The number of results to return, max of 50, default is 25
    def self.feed(brewery_id, options={})
      options.merge!(auth_options)
      response_to_mash get("/brewery/checkins/#{brewery_id}", :query => options)
    end

    def self.info(brewery_id)
      response_to_mash get("/brewery/info/#{brewery_id}", :query => auth_options)
    end

    def self.search(q)
      options = { :q => q }
      options.merge!(auth_options)
      response_to_mash get("/search/brewery", :query => options)
    end
  end
end
