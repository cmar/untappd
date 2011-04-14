require File.dirname(__FILE__) + '/spec_helper'

describe "User" do
  
  before(:all) do
    Untappd.configure do |config|
        config.apikey = '6666666666666666666666'
    end
  end
    
  before(:each) do
    @response = {:results =>[]}
    @response.stub(:code => 200)
    Untappd::User.stub(:get => @response)
  end
  
  it "get info" do
    @response[:results] = {:user => {
                              :user_name => "cmar",
                              :first_name => "cmar"
                              }
                           }
    
    Untappd::User.should_receive(:get).with("/user", anything())
    
    info = Untappd::User.info("cmar")    
    info.user.user_name.should == "cmar"
  end
  
  it "get badges" do
    @response[:results] << {
                              :badge_name => "Newbie",
                              :checkin_id => "413105"
                            }
                            
    Untappd::User.should_receive(:get).with("/user_badge", anything())
                            
    badges = Untappd::User.badges("cmar")    
    badges.first.badge_name.should == "Newbie"
  end
  
  it "get friends" do
    @response[:results] << {
                              :user_name => "pks1850",
                              :user_id => "10819"
                            }

    Untappd::User.should_receive(:get).with("/friends", anything())
   
    friends = Untappd::User.friends("cmar")    
    friends.first.user_name.should == "pks1850"
  end
  
  it "get wish list" do
     @response[:results] << {
                                :user => {:user_name => "cmar"},
                                :beer_name => "Aprihop",
                                :beer_id => "4665"
                            }

    Untappd::User.should_receive(:get).with("/wish_list", anything())
   
    wish_list = Untappd::User.wish_list("cmar")    
    wish_list.first.beer_name.should == "Aprihop"
  end
  
  it "get distinct beers" do
     @response[:results] << {
                                :user => {:user_name => "cmar"},
                                :beer_name => "Aprihop",
                                :beer_id => "4665"
                            }
                            
    Untappd::User.should_receive(:get).with("/distinct", anything())
                            
    distinct_beers = Untappd::User.distinct("cmar")    
    distinct_beers.first.beer_name.should == "Aprihop"
  end
  
  it "get feed" do
     @response[:results] << {
                                :user => {:user_name => "cmar"},
                                :beer_name => "Aprihop",
                                :checkin_id => "551239"
                            }

    Untappd::User.should_receive(:get).with("/user_feed", anything())
    
    feed = Untappd::User.feed("cmar")    
    feed.first.beer_name.should == "Aprihop"
  end
  
  it "get friend feed" do
     @response[:results] << {
                                :user => {:user_name => "cmar"},
                                :beer_name => "Aprihop",
                                :checkin_id => "551239"
                            }

    Untappd::User.should_receive(:get).with("/feed", anything())
                            
    feed = Untappd::User.friend_feed("cmar", "password")    
    feed.first.checkin_id.should == "551239"
  end
  
end

#User feed JSON
#{"http_code":200,"returned_results":2,"next_query":"http:\/\/api.untappd.com\/v3\/user_feed?user=cmar&since=551239","next_page":"http:\/\/api.untappd.com\/v3\/user_feed?user=cmar&offset=25","results":[{"user":{"user_name":"cmar","first_name":"cmar","last_name":"","user_avatar":"http:\/\/gravatar.com\/avatar.php?gravatar_id=cf989ae1f7ddd979f38b00ec033a0e7d&amp;rating=X&amp;size=80&amp;default=https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/default_avatar.jpg","location":"Leesburg, VA","bio":"","is_friends":null,"url":""},"checkin_id":"551239","beer_id":"4665","brewery_id":"459","beer_name":"Aprihop","brewery_name":"Dogfish Head Craft Brewery","created_at":"Wed, 30 Mar 2011 20:03:03 +0000","check_in_comment":"Love this beer. Similar to Magic Hat #9","checkin_link":"http:\/\/untappd.com\/user\/cmar\/checkin\/551239","beer_stamp":"https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/temp\/badge-beer-default.png","venue_name":null,"venue_id":null,"venue_lat":null,"venue_lng":null},
  
#User distinct JSON
#{"http_code":200,"returned_results":2,"next_page":"http:\/\/api.untappd.com\/v3\/user_distinct\/cmar?offset=25","results":[{"user":{"user_name":"cmar","first_name":"cmar","last_name":"","user_avatar":"http:\/\/gravatar.com\/avatar.php?gravatar_id=cf989ae1f7ddd979f38b00ec033a0e7d&amp;rating=X&amp;size=80&amp;default=https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/default_avatar.jpg","location":"Leesburg, VA","bio":"","is_friends":null,"url":""},"beer_id":"4665","brewery_id":"459","checkin_id":"551239","beer_name":"Aprihop","brewery_name":"Dogfish Head Craft Brewery","created_at":"Wed, 30 Mar 2011 20:03:03 +0000","checkin_link":"http:\/\/untappd.com\/user\/cmar\/checkin\/551239","beer_stamp":"https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/temp\/badge-beer-default.png"},
  
#User wishlist JSON
#{"http_code":200,"returned_results":2,"results":[{"user":{"user_name":"cmar","first_name":"cmar","last_name":"","user_avatar":"http:\/\/gravatar.com\/avatar.php?gravatar_id=cf989ae1f7ddd979f38b00ec033a0e7d&amp;rating=X&amp;size=80&amp;default=https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/default_avatar.jpg","location":"Leesburg, VA","bio":"","is_friends":null,"url":""},"beer_name":"Aprihop","beer_id":"4665","brewery_id":"459","brewery_name":"Dogfish Head Craft Brewery","created_at":"Wed, 30 Mar 2011 20:03:27 +0000","beer_stamp":"https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/temp\/badge-beer-default.png"},
  
#User friends JSON
#{"http_code":200,"returned_results":1,"next_page":"http:\/\/api.untappd.com\/v3\/friends\/cmar?offset=25","results":[{"user_id":"10819","user_name":"pks1850","first_name":"sam","last_name":"","user_avatar":"http:\/\/gravatar.com\/avatar.php?gravatar_id=414bd46a3e2ccdb0620d80a30c088ac2&amp;rating=X&amp;size=80&amp;default=https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/default_avatar.jpg","location":"","bio":"","is_friends":null,"is_requested":null,"url":"http:\/\/WWW.TEST.COM","date_joined":"Thu, 23 Dec 2010 16:58:12 +0000","is_private":"0"}]}

#User Badges JSON
#{"http_code":200,"returned_results":1,"results":[{"badge_name":"Newbie","checkin_id":"413105","badge_description":"So, you're new around here? Congrats on your first brew! This ones for you.","badge_image_sm":"https:\/\/untappd.s3.amazonaws.com\/assets\/badges\/bdg_newbie_sm.png","badge_image_md":"https:\/\/untappd.s3.amazonaws.com\/assets\/badges\/bdg_newbie_md.png","badge_image_lg":"https:\/\/untappd.s3.amazonaws.com\/assets\/badges\/bdg_newbie_lg.png","badge_category":"Beer Badges","badge_earned_date":"Mon, 07 Mar 2011 01:45:07 +0000","badge_link":"http:\/\/untappd.com\/user\/cmar\/badge\/58708"}]}


#User Info JSON
#{"http_code":200,"results":{"user":{"user_name":"cmar","first_name":"cmar","last_name":"","user_avatar":"http:\/\/gravatar.com\/avatar.php?gravatar_id=cf989ae1f7ddd979f38b00ec033a0e7d&amp;rating=X&amp;size=80&amp;default=https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/default_avatar.jpg","location":"Leesburg, VA","bio":"","is_friends":null,"url":"","date_joined":"Thu, 23 Dec 2010 17:22:26 +0000","is_private":"0","total_badges":"1","total_friends":"1","total_checkins":"2","total_beers":"2","total_created_beers":"0","social_accounts":{"facebook":true,"twitter":true,"foursquare":true}}}}