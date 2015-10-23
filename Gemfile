source ENV['GEM_SOURCE'] || 'https://rubygems.org'

facterversion = ENV['FACTER_GEM_VERSION'] || '2.4.4'
puppetversion = ENV['PUPPET_GEM_VERSION'] || '3.8.3'

gem 'rake'
gem 'rspec'
gem 'rspec-puppet'
gem 'rspec-puppet-facts'
gem 'puppetlabs_spec_helper'
gem 'puppet-lint'
gem 'metadata-json-lint'

gem 'facter', *location_for(facterversion)
gem 'puppet', *location_for(puppetversion)
