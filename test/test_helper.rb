require 'minitest/autorun'
require 'minitest/reporters'
require 'mocha/minitest'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../app/loaders/product_loader'
require_relative '../app/services/product_display'
require_relative '../app/services/user_input'
require_relative '../app/checkout/pricing_rules/ceo_rule'
require_relative '../app/checkout/pricing_rules/coo_rule'
require_relative '../app/checkout/pricing_rules/cto_rule'