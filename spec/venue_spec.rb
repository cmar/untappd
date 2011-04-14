require File.dirname(__FILE__) + '/spec_helper'

describe "Venue" do
  
  before(:all) do
    Untappd.configure do |config|
        config.apikey = '6666666666666666666666'
    end
  end
    
  before(:each) do
    @response = {:results =>[]}
    @response.stub(:code => 200)
    Untappd::Venue.stub(:get => @response)
  end
  
  it "gets the feed" do
    @response[:results] << { :user => {:user_name => "cmar"},
                             :checkin_id => "610233",
                             :beer_id => "18099",
                             :beer_name => "Arrogant Bastard Ale",
                             :brewery_name => "Stone Brewing Co."}
    
    Untappd::Venue.should_receive(:get).with("/venue_checkins", anything())
    
    feed = Untappd::Venue.feed(18099)    
    feed.first.beer_name.should == "Arrogant Bastard Ale"
  end

  it "gets info" do
    @response[:results] = { :name => "Terminal 5",
                             :foursquare_id => "4ad6bf91f964a520380821e3"
                            }

    Untappd::Venue.should_receive(:get).with("/venue_info", anything())

    info = Untappd::Venue.info(18099)    
    info.name.should == "Terminal 5"
  end
  
end

#Venue info JSON
# "http_code":200,"results":{"name":"Terminal 5","internal_venue_id":"29296","foursquare_id":"4ad6bf91f964a520380821e3","legacy_foursquare_id":"0","img":"https:\/\/foursquare.com\/img\/categories\/travel\/airport_terminal.png","total_count":"3","unique_count":"2","monthly_count":"2","weekly_count":"0","geolat":"51.4718","geolng":"-0.489278","primary_category":"Travel Spots","address":"LHR Airport","city":"Hounslow","state":"Middlesex","foursquare_link":"http:\/\/4sq.com\/8Nxc2S"}}

#Venue feed JSON
#{"next_query":"http:\/\/api.untappd.com\/v3\/venue_checkins?venue_id=29296&since=433447","next_page":"http:\/\/api.untappd.com\/v3\/venue_checkins?venue_id=29296&offset=25","http_code":200,"results":[{"user":{"user_name":"Netclectic","first_name":"Ade","last_name":"","user_avatar":"http:\/\/gravatar.com\/avatar.php?gravatar_id=bc1736a7204955210453d2dbd441a0f9&amp;rating=X&amp;size=80&amp;default=https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/default_avatar.jpg","location":"Glasgow, Scotland","bio":"I like beer, it makes me a jolly good fellow...","is_friends":null,"url":"http:\/\/www.netclectic.com"},"checkin_id":"640369","beer_id":"6422","brewery_id":"302","beer_name":"Hoegaarden Original White Ale","brewery_name":"Brouwerij van Hoegaarden (InBev)","created_at":"Tue, 12 Apr 2011 11:25:39 +0000","check_in_comment":"So refreshing it would be rude not to have another one","checkin_link":"http:\/\/untappd.com\/user\/Netclectic\/checkin\/640369","beer_stamp":"https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/temp\/badge-beer-default.png","venue_name":"Terminal 5","venue_id":"29296","venue_lat":"51.4718","venue_lng":"-0.489278"},{"user":{"user_name":"Netclectic","first_name":"Ade","last_name":"","user_avatar":"http:\/\/gravatar.com\/avatar.php?gravatar_id=bc1736a7204955210453d2dbd441a0f9&amp;rating=X&amp;size=80&amp;default=https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/default_avatar.jpg","location":"Glasgow, Scotland","bio":"I like beer, it makes me a jolly good fellow...","is_friends":null,"url":"http:\/\/www.netclectic.com"},