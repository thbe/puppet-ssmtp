source 'https://rubygems.org'

if ENV.key?('PUPPET_VERSION')
  puppetversion = "= #{ENV['PUPPET_VERSION']}"
else
  puppetversion = ['>= 2.7']
end

gem 'rake'
gem 'rspec'
gem 'rspec-puppet'
gem 'rspec-puppet-facts'

gem 'puppetlabs_spec_helper'

gem 'puppet-lint'
gem 'metadata-json-lint'

gem 'facter'
gem 'puppet', puppetversion

gem 'pry'
gem 'simplecov'

gem 'mocha'
gem 'serverspec'

gem 'beaker'
gem 'beaker-rspec'
gem 'beaker-rspec'
gem 'beaker-puppet_install_helper'
