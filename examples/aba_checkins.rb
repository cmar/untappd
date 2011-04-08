#list the recent checkins for Arrogant Bastard Ale
require 'rubygems'
require 'untappd'

Untappd.configure do |config|
  config.apikey = 'YOUR_API_KEY'
end

checkins = Untappd::Beer.checkins(18099)
checkins.each do |checkin|
  puts "#{checkin.user.first_name} at #{checkin.created_at}" 
end

info = Untappd::Beer.info(18099)
puts "#{info.name} by #{info.brewery}"
puts info.inspect

# Example JSON response
# {
#     "next_query":"http:\/\/api.untappd.com\/v3\/beer_checkins?bid=18099&since=603321",
#     "next_page":"http:\/\/api.untappd.com\/v3\/beer_checkins?bid=18099&offset=25",
#     "http_code":200,
#     "results":
#     [
#         {
#             "user":
#             {
#                 "user_name":"JJP1115",
#                 "first_name":"Jim",
#                 "last_name":"P.",
#                 "user_avatar":"http:\/\/gravatar.com\/avatar.php?gravatar_id=a0bb3b077c11e0c087e53212bf49ba49&amp;rating=X&amp;size=80&amp;default=https:\/\/untappd.s3.amazonaws.com\/site\/assets\/images\/default_avatar.jpg",
#                 "location":"Berkeley,
#                  Illinois",
#                 "bio":"",
#                 "is_friends":null,
#                 "url":"http:\/\/www.facebook.com\/#!\/JPerez1115"
#             },
#             "checkin_id":"610208",
#             "beer_id":"18099",
#             "brewery_id":"1204",
#             "beer_name":"Arrogant Bastard Ale",
#             "brewery_name":"Stone Brewing Co.",
#             "created_at":"Fri,
#              08 Apr 2011 05:24:23 +0000",
#             "check_in_comment":"",
#             "checkin_link":"http:\/\/untappd.com\/user\/JJP1115\/checkin\/NUekq56",
#             "beer_stamp":"https:\/\/untappd.s3.amazonaws.com\/site\/beer_logos\/beer-arrogantBastardAle.jpg",
#             "venue_name":null,
#             "venue_id":null,
#             "venue_lat":null,
#             "venue_lng":null
#         },