#list the recent checkins for username "cmar"
require 'rubygems'
require 'untappd'

Untappd.configure do |config|
  config.client_id = 'YOUR_CLIENT_ID'
  config.client_secret = 'YOUR_CLIENT_SECRET'
end

feed = Untappd::User.feed("cmar")
feed.checkins.items.each do |f|
  puts "#{f.beer.beer_name} from #{f.brewery.brewery_name} by #{f.user.first_name} at #{f.created_at}"
end