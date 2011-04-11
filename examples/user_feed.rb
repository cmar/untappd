#list the recent checkins for Arrogant Bastard Ale
require 'rubygems'
require 'untappd'

Untappd.configure do |config|
  config.apikey = 'YOUR_API_KEY'
end

feed = Untappd::User.feed("cmar")
feed.each do |f|
  puts "#{f.user.first_name} at #{f.created_at}" 
end