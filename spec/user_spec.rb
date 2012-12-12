require File.dirname(__FILE__) + '/spec_helper'

describe "User" do
  before do
    configure_untappd
  end

  it "get info", :vcr do
    info = Untappd::User.info("cmar")
    info.user.user_name.should == "cmar"
  end

  it "get badges", :vcr do
    badges = Untappd::User.badges("cmar")
    badges.items.first.badge_name.should == "Newbie"
  end

  it "get friends", :vcr do
    friends = Untappd::User.friends("cmar")
    friends.items.first.user.user_name.should == "pks1850"
  end

  it "get wish list", :vcr do
    wish_list = Untappd::User.wish_list("cmar")
    wish_list.beers.items.first.beer.beer_name.should == "DFH Ale"
  end

  it "get distinct beers", :vcr do
    distinct_beers = Untappd::User.distinct("cmar")
    distinct_beers.beers.items.first.beer.beer_name.should == "Palo Santo Marron"
  end

  it "get feed", :vcr do
    feed = Untappd::User.feed("cmar")
    feed.checkins.items.first.beer.beer_name.should == "Palo Santo Marron"
  end

  it "get friend feed", :vcr do
    friend_feed = Untappd::User.friend_feed('5A2891EFDFBE8BD6DEBB0E9FE4147C80655CB914')
    friend_feed.checkins.items.first.beer.beer_name.should == "White Oak"
    friend_feed.checkins.items.first.brewery.brewery_name.should == "The Bruery"
  end
end
