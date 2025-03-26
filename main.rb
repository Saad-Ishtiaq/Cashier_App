require_relative 'config/constants'
require_relative 'app/loaders/product_loader'
require_relative 'app/services/product_display'

class CashierApp
  def initialize
    @products = ProductLoader.load_products
    puts '=== Kantox Supermarket Checkout ==='
  rescue StandardError => e
    abort "Fatal error: #{e.message}"
  end

  def start
    ProductDisplay.show(@products)
  end
end

CashierApp.new.start