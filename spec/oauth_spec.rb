require File.dirname(__FILE__) + '/spec_helper'

describe "OAuth" do
  before do
    configure_untappd
  end

  it "raises an error when the redirect_url isn't configured" do
    expect { Untappd::OAuth.authenticate_url }.to raise_error(RuntimeError)
  end

  it "returns the authentication url when correctly configured" do
    Untappd.config.redirect_url='http://domain.com'
    expected_response = "https://untappd.com/oauth/authenticate/?client_id=abc&response_type=token&redirect_url=http://domain.com"
    Untappd::OAuth.authenticate_url.should == expected_response
  end
end
