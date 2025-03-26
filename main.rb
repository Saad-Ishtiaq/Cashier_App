require_relative 'config/constants'
require_relative 'app/loaders/product_loader'
require_relative 'app/services/product_display'
require_relative 'app/services/user_input'
require_relative 'app/checkout/checkout'
require_relative 'app/checkout/pricing_rules/base_rule'
require_relative 'app/checkout/pricing_rules/ceo_rule'
require_relative 'app/checkout/pricing_rules/coo_rule'
require_relative 'app/checkout/pricing_rules/cto_rule'

class CashierApp
  def initialize
    @products = ProductLoader.load_products
    puts '=== Kantox Supermarket Checkout ==='
  rescue StandardError => e
    abort "Fatal error: #{e.message}"
  end

  def start
    ProductDisplay.show(@products)
    selected_codes = UserInput.ask_for_products(@products)
    active_rules = UserInput.select_pricing_rules

    co = Checkout.new(active_rules, @products)
    selected_codes.each { |code| co.scan(code) }

    puts "\nTotal Price: £#{co.total}"
  end
end

CashierApp.new.start