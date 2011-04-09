module Untappd
  
  class Beer < Base
    def self.checkins(beer_id, options={})
      options.merge!({
        :key => Untappd::apikey,
        :bid => beer_id
      })

      response_to_mash get("/beer_checkins", :query => options)
    end
    
    def self.info(beer_id, options={})
      options.merge!({
        :key => Untappd::apikey,
        :bid => beer_id
      })

      response_to_mash get("/beer_info", :query => options)
    end
    
    def self.search(q, options={})
      options.merge!({
        :key => Untappd::apikey,
        :q => q
      })

      response_to_mash get("/beer_search", :query => options)
    end
  end
  
end
