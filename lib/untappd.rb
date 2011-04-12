require 'rubygems'

require "untappd/base"
require "untappd/beer"
require "untappd/user"
require "untappd/venue"
require "untappd/brewery"
require "untappd/checkin"

module Untappd
  @apikey = nil

  def self.apikey
    @@apikey
  end

  def self.apikey=(apikey)
    @@apikey = apikey
  end

  def self.configure
    yield self
  end
    
end
