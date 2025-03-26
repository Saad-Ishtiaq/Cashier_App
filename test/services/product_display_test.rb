require_relative '../../test/test_helper'

class ProductDisplayTest < Minitest::Test
  def test_shows_products_correctly
    products = {
      'GR1' => { name: 'Green Tea', price: 3.11 },
      'SR1' => { name: 'Strawberries', price: 5.00 }
    }

    output = StringIO.new
    $stdout = output
    ProductDisplay.show(products)
    $stdout = STDOUT

    assert_includes output.string, 'GR1: Green Tea - £3.11'
    assert_includes output.string, 'SR1: Strawberries - £5.0'
  end
end
