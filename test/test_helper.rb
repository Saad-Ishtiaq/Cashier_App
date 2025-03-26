require 'minitest/autorun'
require 'minitest/reporters'
require 'mocha/minitest'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../app/loaders/product_loader'
