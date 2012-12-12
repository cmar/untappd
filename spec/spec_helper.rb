$TESTING=true
$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'untappd'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :fakeweb
  c.configure_rspec_metadata!
  c.filter_sensitive_data('<UNTAPPD_CLIENT_ID>') { Untappd.config.client_id }
  c.filter_sensitive_data('<UNTAPPD_CLIENT_SECRET>') { Untappd.config.client_secret }
  c.filter_sensitive_data('<UNTAPPD_ACCESS_TOKEN>') { 'some_access_token' }
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

def configure_untappd
  Untappd.configure do |config|
    # use your real credentials when rebuilding VCR cassettes
    config.client_id = 'abc'
    config.client_secret = '123'
  end
end