require 'rspec'
require_relative '../lib/nasa'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation

end 