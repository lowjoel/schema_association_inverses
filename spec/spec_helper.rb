require 'simplecov'
require 'simplecov-gem-profile'
SimpleCov.start 'gem'

$LOAD_PATH.unshift(__dir__)
$LOAD_PATH.unshift(File.join(__dir__, '..', 'lib'))

require 'rspec'
require 'active_record'
require 'schema_plus/core'
require 'schema_plus_association_inverses'
require 'schema_dev/rspec'

Dir[__dir__ + '/support/**/*.rb'].each {|f| require f}

SchemaDev::Rspec.setup

RSpec.configure do |config|
  config.warnings = true
end

SimpleCov.command_name "[ruby #{RUBY_VERSION} - ActiveRecord #{::ActiveRecord::VERSION::STRING} - #{ActiveRecord::Base.connection.adapter_name}]"
