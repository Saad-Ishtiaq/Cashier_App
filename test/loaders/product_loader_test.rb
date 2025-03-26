require_relative '../test_helper'

class ProductLoaderTest < Minitest::Test
  def setup
    @test_file = File.join(Config::DATA_DIR, 'test_products.csv')
    create_test_csv(@test_file)
  end

  def teardown
    File.delete(@test_file) if File.exist?(@test_file)
  end

  def create_test_csv(file_path)
    CSV.open(file_path, 'w', headers: true) do |csv|
      csv << ['Product Code', 'Name', 'Price']
      csv << ['GR1', 'Green tea', 3.11]
      csv << ['SR1', 'Strawberries', 5.00]
      csv << ['CF1', 'Coffee', 11.23]
    end
  end

  def test_load_products_success
    products = ProductLoader.load_products('test_products.csv')

    assert_equal 3, products.size
    assert products.key?('GR1')
    assert_equal 'Green tea', products['GR1'][:name]
    assert_equal 3.11, products['GR1'][:price]
  end

  def test_load_products_failure
    assert_raises(RuntimeError) do
      ProductLoader.load_products('non_existent_file.csv')
    end
  end
end
