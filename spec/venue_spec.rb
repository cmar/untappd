require File.dirname(__FILE__) + '/spec_helper'

describe "Venue" do
  before do
    configure_untappd
  end

  it "gets the feed", :vcr do
    feed = Untappd::Venue.feed(18099)
    feed.checkins.items.first.beer.beer_name.should == "Pale Ale"
    feed.checkins.items.first.brewery.brewery_name.should == "Sierra Nevada Brewing Co."
  end

  it "gets info", :vcr do
    info = Untappd::Venue.info(18099)
    info.venue.venue_name.should == "Mo's Diner"
  end

  it "gets foursquare lookup", :vcr do
    foursquare = Untappd::Venue.foursquare_lookup('4ccf5fec1ac7a1cd6a5c1392')
    foursquare.venue.items.first.venue_name.should == "Untappd HQ - East"
  end

end
