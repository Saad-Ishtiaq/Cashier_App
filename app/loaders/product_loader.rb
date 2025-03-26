require 'csv'
require_relative '../../config/constants'

class ProductLoader
  def self.load_products(filename = Config::DEFAULT_PRODUCTS_CSV)
    file_path = File.join(Config::DATA_DIR, filename)
    products = {}

    CSV.foreach(file_path, headers: true) do |row|
      code = row['Product Code'].strip
      name = row['Name'].strip
      price = row['Price'].to_f
      products[code] = { name: name, price: price }
    end

    products
  rescue StandardError => e
    raise "Failed to load products: #{e.message}"
  end
end
