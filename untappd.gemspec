# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "untappd/version"

Gem::Specification.new do |s|
  s.name        = "untappd"
  s.version     = Untappd::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["cmar"]
  s.email       = ["cmar@github.com"]
  s.homepage    = "http://cmar.me"
  s.summary     = %q{Wrapper around the untappd.com API}
  s.description = %q{wrapper around the untappd.com API}

  s.rubyforge_project = "untappd"

  s.add_dependency('httparty', '>= 0.7.3')
  s.add_dependency('hashie', '>= 1.0.0')
  
  s.add_development_dependency('rspec')
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
