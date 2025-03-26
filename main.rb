require_relative 'config/constants'
require_relative 'app/loaders/product_loader'
require_relative 'app/services/product_display'
require_relative 'app/services/user_input'

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

    puts selected_codes
  end
end

CashierApp.new.start