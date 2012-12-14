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
  c.filter_sensitive_data('<UNTAPPD_ACCESS_TOKEN>') { TEST_ACCESS_TOKEN }
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

def configure_untappd
  Untappd.configure do |config|
    # use your real credentials when rebuilding VCR cassettes
    config.client_id = 'replace_with_your_client_id'
    config.client_secret = 'replace_with_your_client_secret'
  end
end

TEST_ACCESS_TOKEN = 'replace_with_your_access_token'