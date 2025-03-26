require_relative '../../test/test_helper'

class UserInputTest < Minitest::Test
  def setup
    @products = {
      'GR1' => { name: 'Green Tea', price: 3.11 },
      'SR1' => { name: 'Strawberries', price: 5.00 }
    }
  end

  def test_ask_for_products_with_valid_codes
    UserInput.stubs(:gets).returns("GR1, SR1\n")
    valid_codes = UserInput.ask_for_products(@products)

    assert_equal %w[GR1 SR1], valid_codes
  end

  def test_ask_for_products_with_invalid_code
    UserInput.stubs(:gets).returns("invalid, GR1\n")
    valid_codes = UserInput.ask_for_products(@products)

    assert_equal ['GR1'], valid_codes
  end
end
