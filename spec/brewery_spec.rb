require File.dirname(__FILE__) + '/spec_helper'

describe "Brewery" do
  before do
    configure_untappd
  end

  it "get feed", :vcr do
    checkins = Untappd::Brewery.feed(157)    
    checkins.checkins.items.first.brewery.brewery_name.should == "Boston Beer Company (Samuel Adams)"
  end
  
  it "get info", :vcr do
    info = Untappd::Brewery.info(157)    
    info.brewery.brewery_name.should == "Boston Beer Company (Samuel Adams)" 
  end
  
  it "get search", :vcr do
    search = Untappd::Brewery.search("Boston Beer")
    search.brewery.items.first.brewery.brewery_name.should == "Boston Beer Works"
  end  
end
