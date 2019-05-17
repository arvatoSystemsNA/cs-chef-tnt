require 'chefspec'
require 'chefspec/berkshelf'
require 'chefspec/cacher'
#require 'simplecov'
#require 'codecov'

#SimpleCov.start

#if ENV['CI'] == 'true'
#  require 'codecov'
#  SimpleCov.formatter = SimpleCov::Formatter::Codecov
#else
#  SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
#end

RSpec.configure do |c|
  c.log_level = :info
  c.expect_with(:rspec) { |e| e.syntax = :expect }
  c.version = '12'
end

#at_exit { ChefSpec::Coverage.report! }
