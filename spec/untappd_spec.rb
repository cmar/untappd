require File.dirname(__FILE__) + '/spec_helper'

describe "Untappd" do
  
  it "should configure Rails initializer style" do
    Untappd.configure do |config|
       config.apikey = 'c01822f029486661bb3669a845b5ec14'
    end
    
    Untappd.apikey.should eq 'c01822f029486661bb3669a845b5ec14'
  end
  
end