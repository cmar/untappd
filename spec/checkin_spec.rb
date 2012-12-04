# require File.dirname(__FILE__) + '/spec_helper'

# describe "Checkin" do
  
#   before(:all) do
#     Untappd.configure do |config|
#         config.apikey = '6666666666666666666666'
#     end
#   end

#   before(:each) do
#     @response = {:results =>[]}
#     @response.stub(:code => 200)
#   end
  
#   context "post" do
    
#     before(:each) do
#       Untappd::Checkin.stub(:post => @response)
#     end
    
#     it "add comment" do
#       Untappd::Checkin.should_receive(:post).with("/add_comment", anything())
#       Untappd::Checkin.add_comment("cmar", "password", 666, "my fancy comment")
#     end
    
#     it "removes comment" do
#       Untappd::Checkin.should_receive(:post).with("/delete_comment", anything())
#       Untappd::Checkin.remove_comment("cmar", "password", 666)
#     end
    
#     it "adds toast" do
#       Untappd::Checkin.should_receive(:post).with("/toast", anything())
#       Untappd::Checkin.toast("cmar", "password", 666)
#     end
    
#     it "removes toast" do
#       Untappd::Checkin.should_receive(:post).with("/delete_toast", anything())
#       Untappd::Checkin.untoast("cmar", "password", 666)
#     end
    
#     it "creates checkin" do
#       Untappd::Checkin.should_receive(:post).with("/checkin", anything())
#       Untappd::Checkin.create("cmar", "password", 4665)
#     end
    
#     it "creates test checkin" do
#       Untappd::Checkin.should_receive(:post).with("/checkin_test", anything())
#       Untappd::Checkin.test("cmar", "password", 4665)
#     end
    
#   end
  
#   context "get" do
    
#     before(:each) do
#       Untappd::Checkin.stub(:get => @response)
#     end
  
#     it "gets info" do
#       @response[:results] = { :user => {:user_name => "cmar"},
#                                :checkin_id => "610233",
#                                :beer_id => "18099",
#                                :beer_name => "Arrogant Bastard Ale",
#                                :brewery_name => "Stone Brewing Co."}

#       Untappd::Checkin.should_receive(:get).with("/details", anything())
      
#       checkin = Untappd::Checkin.info(18099)    
#       checkin.beer_name.should == "Arrogant Bastard Ale"
#     end
  
#     it "gets thepub feed" do
#       @response[:results] << {:checkin_id => "610208",
#                               :beer_id => "18099",
#                               :beer_name => "Arrogant Bastard Ale",
#                               :brewery_name => "Stone Brewing Co."}

#       Untappd::Checkin.should_receive(:get).with("/thepub", anything())
      
#       checkins = Untappd::Checkin.feed()    
#       checkins.first.beer_name.should == "Arrogant Bastard Ale"
#     end
    
#   end
  
# end


# #Checkin info JSON
# #{"http_code":200,"results":{"user":{"user_name":"miamichael2","first_name":"Michael","last_name":"","user_avatar":"https:\/\/untappd.s3.amazonaws.com\/profile\/d05bf16dede98638c3521b157d12356d_thumb.JPG","location":"Miami","bio":"","is_friends":null,"url":null},"beer_id":"4948","brewery_id":"1000","checkin_id":"617763","toast_count":"0","comments":[],"beer_name":"Mamma Mia! Pizza Beer","brewery_name":"Pizza Beer","created_at":"Sat, 09 Apr 2011 03:34:32 +0000","check_in_comment":"A for effort and it really does smell and taste like pizza, but this is absolutely disgusting.  http:\/\/flic.kr\/p\/9x1eC2","checkin_link":"http:\/\/untappd.com\/user\/miamichael2\/checkin\/617763","beer_stamp":"https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/temp\/badge-beer-default.png","venue_name":"Midtown 2","venue_id":"38754","venue_lat":"25.8094","venue_lng":"-80.1915"}}