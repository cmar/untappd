require File.dirname(__FILE__) + '/spec_helper'

describe "Beer" do
  
  before(:all) do
    Untappd.configure do |config|
        config.apikey = '6666666666666666666666'
    end
  end
    
  before(:each) do
    @response = {:results =>[]}
    @response.stub(:code => 200)
    Untappd::Beer.stub(:get => @response)
  end
  
  it "should get checkins" do
    @response[:results] << {:checkin_id => "610208",
                            :beer_id => "18099",
                            :beer_name => "Arrogant Bastard Ale",
                            :brewery_name => "Stone Brewing Co."}

    checkins = Untappd::Beer.checkins(18099)    
    checkins.first.beer_name.should == "Arrogant Bastard Ale"
  end
  
  it "should get info" do
    @response[:results] = {:brewery_id => "1204",
                            :beer_id => "18099",
                            :name => "Arrogant Bastard Ale",
                            :brewery => "Stone Brewing Co."}

    info = Untappd::Beer.info(18099)    
    info.name.should == "Arrogant Bastard Ale"
  end
  
  it "should search" do
    @response[:results] << {:beer_id => "18099",
                            :beer_name => "Arrogant Bastard Ale",
                            :brewery_name => "Stone Brewing Co."}
    
    search = Untappd::Beer.info('stone')    
    search.first.beer_name.should == "Arrogant Bastard Ale"
  end
  
  it "gets the trending beers" do
    @response[:results] << {:beer_id => "18099",
                            :beer_name => "Arrogant Bastard Ale",
                            :brewery_name => "Stone Brewing Co."}
    
    trending = Untappd::Beer.trending()    
    trending.first.beer_name.should == "Arrogant Bastard Ale"
  end
  
end

#beer trending JSON
# {"http_code":200,"results":[{"beer_name":"Samuel Adams Noble Pils","beer_id":"5743","brewery_id":"157","count":"66","brewery_name":"Boston Beer Company","img":"https:\/\/untappd.s3.amazonaws.com\/site\/beer_logos\/beer-saNobilePils.jpg"},{"beer_name":"Bud Light","beer_id":"3784","brewery_id":"44","count":"55","brewery_name":"Anheuser-Busch","img":"https:\/\/untappd.s3.amazonaws.com\/site\/beer_logos\/beer-budLight.jpg"},{"beer_name":"Miller Lite","beer_id":"3811","brewery_id":"863","count":"55","brewery_name":"Miller Brewing Company","img":"https:\/\/untappd.s3.amazonaws.com\/site\/beer_logos\/beer-millerLite.jpg"},
  
#beer checkin JSON
#{"next_query":"http:\/\/api.untappd.com\/v3\/beer_checkins?bid=18099&since=610053","next_page":"http:\/\/api.untappd.com\/v3\/beer_checkins?bid=18099&offset=25","http_code":200,"results":[{"user":{"user_name":"micek","first_name":"Cory","last_name":"M.","user_avatar":"https:\/\/untappd.s3.amazonaws.com\/profile\/0d781dfce6d3acfdfbbe9f2692a0d0e4_thumb.jpg","location":"San Diego, CA","bio":"interactive designer\/developer\/creativist, obsessed with user experience, loose leaf teas and micro brews","is_friends":null,"url":""},"checkin_id":"618853","beer_id":"18099","brewery_id":"1204","beer_name":"Arrogant Bastard Ale","brewery_name":"Stone Brewing Co.","created_at":"Sat, 09 Apr 2011 05:27:09 +0000","check_in_comment":"","checkin_link":"http:\/\/untappd.com\/user\/micek\/checkin\/BETZs89","beer_stamp":"https:\/\/untappd.s3.amazonaws.com\/site\/beer_logos\/beer-arrogantBastardAle.jpg","venue_name":"El Take It Easy","venue_id":"272","venue_lat":"32.749","venue_lng":"-117.13"}
  
#beer info JSON
# {"http_code":200,"results":{"name":"Arrogant Bastard Ale","beer_id":"18099","brewery":"Stone Brewing Co.","brewery_id":"1204","img":"https:\/\/untappd.s3.amazonaws.com\/site\/beer_logos\/beer-arrogantBastardAle.jpg","total_count":"1553","unique_count":"1041","monthly_count":"193","weekly_count":"161","beer_abv":"7.2","beer_created":"Mon, 27 Dec 2010 20:34:38 +0000","type":"American Strong Ale","beer_creator":"Firmansyah","beer_creator_id":"9041"}}

#beer search JSON
#{"search_term":"stone","http_code":200,"returned_results":25,"next_page":"http:\/\/api.untappd.com\/v3\/beer_search?q=stone&offset=25","results":[{"beer_id":"29100","beer_name":" Arrogant Bastard Ale Aged In Bourbon Barrels","beer_stamp":"https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/temp\/badge-beer-default.png","brewery_id":"1204","brewery_name":"Stone Brewing Co.","brewery_stamp":"https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/temp\/badge-brewery-default.png","country_name":"United States","total_count":"11"}