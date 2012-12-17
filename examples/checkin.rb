#a couple of checkin methods
require 'rubygems'
require 'untappd'

Untappd.configure do |config|
  config.client_id = 'YOUR_CLIENT_ID'
  config.client_secret = 'YOUR_CLIENT_SECRET'
end

access_token = 'YOUR_ACCESS_TOKEN'

Untappd::Checkin.create(access_token, -6, 'CST', 4665
            :foursquare_id => "4ad6bf91f964a520380821e3",
            :user_lat => "51.4718",
            :user_lng => "-0.489278")

puts checkin.inspect


feed = Untappd::User.friend_feed(access_token)
puts feed.inspect

comment = Untappd::Checkin.add_comment(access_token, 414882, "this is a test")
puts comment.inspect

result = Untappd::Checkin.toggle_toast(access_token, 414882)
puts result.inspect