require File.dirname(__FILE__) + '/spec_helper'

describe "User" do
  before do
    configure_untappd
  end

  it "get info", :vcr do
    info = Untappd::User.info("cmar")
    info.user.user_name.should == "cmar"
  end

  it "get info with compact", :vcr do
    info = Untappd::User.info("cmar", :compact => true)
    info.user.user_name.should == "cmar"
    #according to docs recent_brews, media, and checkins should be removed
    #when compact=true
    info.user.recent_brews.should be_nil
    info.user.media.should be_nil
    info.user.checkins.should be_nil
  end

  it "get badges", :vcr do
    badges = Untappd::User.badges("cmar")
    badges.items.first.badge_name.should == "American Craft Beer Week (2013)"
  end

  it "get friends", :vcr do
    friends = Untappd::User.friends("cmar")
    friends.items.first.user.user_name.should == "geekoncoffee"
  end

  it "get wish list", :vcr do
    wish_list = Untappd::User.wish_list("cmar")
    wish_list.beers.items.first.beer.beer_name.should == "90 Minute IPA"
  end

  it "get distinct beers", :vcr do
    distinct_beers = Untappd::User.distinct("cmar")
    distinct_beers.beers.items.first.beer.beer_name.should == "Jai Alai IPA"
  end

  it "get feed", :vcr do
    feed = Untappd::User.feed("cmar")
    feed.checkins.items.first.beer.beer_name.should == "Jai Alai IPA"
  end

  it "get friend feed", :vcr do
    friend_feed = Untappd::User.friend_feed(TEST_ACCESS_TOKEN)
    friend_feed.checkins.items.first.beer.beer_name.should == "Paulaner Oktoberfest Bier"
    friend_feed.checkins.items.first.brewery.brewery_name.should == "Paulaner Gruppe"
  end
end
