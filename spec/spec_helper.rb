$LOAD_PATH.unshift(__dir__)
$LOAD_PATH.unshift(File.join(__dir__, '..', 'lib'))

require 'rspec'
require 'active_record'
require 'schema_plus/core'

Dir[__dir__ + '/support/**/*.rb'].each {|f| require f}

RSpec.configure do |config|
  config.warnings = true
end
