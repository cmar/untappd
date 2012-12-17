# Untappd

Wrapper around the Untappd API. This organizes the untappd api
into proper RESTFUL objects. See API coverage below for mapping from
the API documentation.

* You will need to register for an API key: http://untappd.com/api/register.
* Attempting to wrap all the API documented here: https://untappd.com/api/docs/v4.
* Required parameters are passed as arguments to the method, optional parameters should be included in the options hash.
* Methods requiring user authentication will require an OAuth access_token. See OAuth Examples below.
* All responses are wrapped in a Hashie::Mash

## Releases

* 0.0.5 Brewery Info and Search
* 0.0.4 Complete coverage of v3 API. Checkins, Comments, Toasts, gmt_offset configuration
* 0.0.3 Venue Info & Feed, Trending Beer, Brewery Feed, Checkin info & Feed (the pub), Renamed Beer.checkins to Beer.feed
* 0.0.2 User feed, distinct beers, info, badges, friends, wish list
* 0.0.1 Beer Search, Info and Checkins

## API Coverage

**Beer Object**
* Beer Feed - Untappd::Beer.feed(beer_id, options={})
* Beer Info - Untappd::Beer.info(beer_id, options={})
* Beer Search - Untappd::Beer.search(q, options={})
* Trending - Untappd::Beer.trending

**User Object**
* User Feed - Untappd::User.feed(username, options={})
* User Info - Untappd::User.info(username)
* User Badges - Untappd::User.badges(username, options={})
* User Friends - Untappd::User.friends(username, options={})
* User Wish List - Untappd::User.wish_list(username, options={})
* User Distinct Beers - Untappd::User.distinct(username, options={})
* Friend Feed - Untappd::User.friend_feed(access_token, options={})

**Venue Object**
* Venue Feed - Untappd::Venue.feed(venue_id, options={})
* Venue Info - Untappd::Venue.info(venue_id)

**Brewery Object**
* Brewery Checkins - Untappd::Brewery.feed(brewery_id, options={})
* Brewery Info - Untappd::Brewery.info(brewery_id)
* Brewery Search - Untappd::Brewery.search(q)

**Checkin Object**
* Checkin Info - Untappd::Checkin.info(checkin_id)
* The Pub Feed - Untappd::Checkin.feed(options={})
* Checkin - Untappd::Checkin.create(access_token, gmt_offset, timezone, beer_id, options={})
* Add Comment - Untappd::Checkin.add_comment(access_token, checkin_id, comment)
* Remove Comment - Untappd::Checkin.remove_comment(access_token, comment_id)
* Toast/Remove Toast - Untappd::Checkin.toggle_toast(access_token, checkin_id)

**TODO**
* Add To Wish List - /v4/user/wishlist/add
* Remove From Wish List - /v4/user/wishlist/delete
* Pending Friends - /v4/user/pending
* Accept Friends - /v4/friend/accept/TARGET_ID
* Reject Friends - /v4/friend/reject/TARGET_ID
* Remove Friends - /v4/friend/remove/TARGET_ID
* Request Friends - /v4/friend/request/TARGET_ID
* Notifications - /v4/notifications
* Foursquare Venue Lookup - /v4/venue/foursquare_lookup/VENUE_ID

## Examples

### Configuration

Add to your Gemfile

    gem 'untappd'

Configure your API KEY

    Untappd.configure do |config|
      config.client_id = 'YOUR_CLIENT_ID'
      config.client_secret = 'YOUR_CLIENT_SECRET'
      config.redirect_url = 'YOUR_OAUTH_REDIRECT_URL' # only if you're using OAuth
      config.gmt_offset = -5
    end

### OAuth

To generate an OAuth authentication request, simply call

    Untappd::OAuth.authenticate_url

This will generate a URL that the user can access in order to authorize the application.
It will look something like this:

     => "https://untappd.com/oauth/authenticate/?client_id=YOUR_CLIENT_ID&response_type=token&redirect_url=YOUR_OAUTH_REDIRECT_URL"

After the user has authenticated your application, they will be redirected back to `YOUR_OAUTH_REDIRECT_URL` with their access token appended to the query string.

### Examples

Get all the checkins for Arrogant Bastard Ale

    checkins = Untappd::Beer.feed(18099) # or Untappd::User.feed("cmar")
    checkins.checkins.items.each do |checkin|
      puts "#{checkin.user.first_name} at #{checkin.created_at}"
    end

Create Checkin

    #foursqure, lat, lng are optional
    Untappd::Checkin.create(ACCESS_TOKEN, -6, 'CST', 4665
                :foursquare_id => "4ad6bf91f964a520380821e3",
                :user_lat => "51.4718",
                :user_lng => "-0.489278")

Search for beers with the name Stone

    beers = Untappd::Beer.search('stone')
    beers.beers.items.each do |beer|
       puts "#{beer.beer.beer_name}"
    end

Get extended info for Arrogant Bastard Ale

    info = Untappd::Beer.info(18099)
    puts "#{info.beer.beer_name} by #{info.beer.brewery.brewery_name}"

All Methods can take additional options specified in the API

    checkins = Untappd::Beer.feed(18099, :offset => 100)

    beers = Untappd::Beer.search('stone', :sort => "count")

### Debugging
You can dump any result to see what values are available with

    info = Untappd::Beer.info(18099)
    puts info.inspect