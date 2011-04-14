#a couple of checkin methods
require 'rubygems'
require 'untappd'

Untappd.configure do |config|
  config.apikey = 'YOUR_API_KEY'
  config.gmt_offset = -5
end

username = "cmar"
password = "password"

checkin = Untappd::Checkin.create(username, password, 4665,
              :foursquare_id => "4ad6bf91f964a520380821e3",
              :user_lat => "51.4718",
              :user_lng => "-0.489278")

puts checkin.inspect


feed = Untappd::User.friend_feed(username, password)
puts feed.inspect

comment = Untappd::Checkin.add_comment(username, password, 414882, "this is a test")
puts comment.inspect

result = Untappd::Checkin.toast(username, password, 414882)
puts result.inspect