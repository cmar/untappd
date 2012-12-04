require File.dirname(__FILE__) + '/spec_helper'

describe "Beer" do
  before do
    configure_untappd
  end

  it "get feed", :vcr do
    checkins = Untappd::Beer.feed(18099)
    checkins.checkins.items.first.beer.beer_name.should == "Arrogant Bastard Ale"
  end

  it "get info", :vcr do
    info = Untappd::Beer.info(18099)
    info.beer.beer_name.should == "Arrogant Bastard Ale"
  end

  it "get search", :vcr do
    search = Untappd::Beer.search('stone')
    search.beers.items.first.beer.beer_name == "Stone IPA"
    search.breweries.items.first.brewery.brewery_name.should == "Stone Fly Rye"
  end

  it "get trending beers", :vcr do
    trending = Untappd::Beer.trending
    trending.macro.items.first.beer.beer_name.should == "Guinness Draught"
    trending.micro.items.first.beer.beer_name.should == "Celebration Ale (2012)"
  end

end