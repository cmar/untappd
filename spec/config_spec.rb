require File.dirname(__FILE__) + '/spec_helper'

describe "Configuration" do 
  it "should configure Rails initializer style" do
    Untappd.configure do |config|
      config.client_id      = 'abc'
      config.client_secret  = '123'
      config.gmt_offset     = -5
      config.base_uri       = 'http://foobar.com'
    end
    
    Untappd.config.client_id.should eq 'abc'
    Untappd.config.client_secret.should eq '123'
    Untappd.config.gmt_offset.should eq -5
    Untappd.config.base_uri.should eq 'http://foobar.com'
  end
end