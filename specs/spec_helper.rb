require 'simplecov'
SimpleCov.start
require 'time'
require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/reporters'

# Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/hotel'
require_relative '../lib/reservation'
