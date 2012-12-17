#list the recent checkins for Arrogant Bastard Ale
require 'rubygems'
require 'untappd'

Untappd.configure do |config|
  config.client_id = 'YOUR_CLIENT_ID'
  config.client_secret = 'YOUR_CLIENT_SECRET'
end

checkins = Untappd::Beer.feed(18099)
checkins.checkins.items.each do |checkin|
  puts "#{checkin.user.first_name} at #{checkin.created_at}"
end

info = Untappd::Beer.info(18099)
puts "#{info.beer.beer_name} by #{info.beer.brewery.brewery_name}"
