require File.dirname(__FILE__) + '/spec_helper'

describe "Brewery" do
  
  before(:all) do
    Untappd.configure do |config|
        config.apikey = '6666666666666666666666'
    end
  end
    
  before(:each) do
    @response = {:results =>[]}
    @response.stub(:code => 200)
    Untappd::Brewery.stub(:get => @response)
  end
  
  it "get feed" do
    @response[:results] << { :user => {:user_name => "cmar"},
                             :checkin_id => "610233",
                             :beer_id => "18099",
                             :beer_name => "Arrogant Bastard Ale",
                             :brewery_name => "Stone Brewing Co."}

    Untappd::Brewery.should_receive(:get).with("/brewery_checkins", anything())
    
    feed = Untappd::Brewery.feed(18099)    
    feed.first.beer_name.should == "Arrogant Bastard Ale"
  end
  
  it "get info" do
    @response[:results] = { :name => "Pizza Beer",
                             :brewery_id => "1000"}

    Untappd::Brewery.should_receive(:get).with("/brewery_info", anything())
    
    info = Untappd::Brewery.info(1000)    
    info.name.should == "Pizza Beer"
  end
  
  it "get search" do
    @response[:results] << { :brewery_id => "18099",
                             :brewery_name => "Stone Brewing Co."}

    Untappd::Brewery.should_receive(:get).with("/brewery_search", anything())
    
    feed = Untappd::Brewery.search(18099)    
    feed.first.brewery_name.should == "Stone Brewing Co."
  end
  
end

# Brewery Search
#{"http_code":200,"returned_results":25,"next_page":"http:\/\/api.untappd.com\/v3\/brewery_search?q=stone&offset=25","results":[{"brewery_id":"1390","brewery_name":"Yellowstone Valley Brewing","brewery_stamp":"https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/temp\/badge-brewery-default.png","country_name":"United States","top_beers":[{"beer_name":"Black Widow Oatmeal Stout","beer_id":"25976","beer_type":"Oatmeal Stout"}
  
# Brewery info JSON
# {"http_code":200,"results":{"name":"Pizza Beer","brewery_id":"1000","country":"United States","img":"https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/temp\/badge-brewery-default.png","brewery_owner":"475","total_count":"5","unique_count":"5","monthly_count":"1","weekly_count":"0","top_beers":[{"beer_name":"Mamma Mia! Pizza Beer","beer_id":"4948","beer_type":"Herbed\/Spiced Beer"}],"twitter_handle":""}}

# Brewery feed JSON
#{"next_query":"http:\/\/api.untappd.com\/v3\/brewery_checkins?brewery_id=1000&since=125187","next_page":"http:\/\/api.untappd.com\/v3\/brewery_checkins?brewery_id=1000&offset=25","http_code":200,"results":[{"user":{"user_name":"miamichael2","first_name":"Michael","last_name":"","user_avatar":"https:\/\/untappd.s3.amazonaws.com\/profile\/d05bf16dede98638c3521b157d12356d_thumb.JPG","location":"Miami","bio":"","is_friends":null,"url":null},"checkin_id":"617763","beer_id":"4948","brewery_id":"1000","beer_name":"Mamma Mia! Pizza Beer","brewery_name":"Pizza Beer","created_at":"Sat, 09 Apr 2011 03:34:32 +0000","check_in_comment":"A for effort and it really does smell and taste like pizza, but this is absolutely disgusting.  http:\/\/flic.kr\/p\/9x1eC2","checkin_link":"http:\/\/untappd.com\/user\/miamichael2\/checkin\/617763","beer_stamp":"https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/temp\/badge-beer-default.png","venue_name":"Midtown 2","venue_id":"38754","venue_lat":"25.8094","venue_lng":"-80.1915"},