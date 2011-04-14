require 'rubygems'

require "untappd/base"
require "untappd/beer"
require "untappd/user"
require "untappd/venue"
require "untappd/brewery"
require "untappd/checkin"

module Untappd
  @@apikey = nil
  @@gmt_offset = 0
  
  def self.apikey
    @@apikey
  end

  def self.apikey=(apikey)
    @@apikey = apikey
  end

  def self.gmt_offset
    @@gmt_offset
  end

  def self.gmt_offset=(gmt_offset)
    @@gmt_offset = gmt_offset
  end
  
  def self.configure
    yield self
  end
    
end
