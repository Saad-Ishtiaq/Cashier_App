require_relative '../../test/test_helper'

class CheckoutTest < Minitest::Test
  def setup
    @products = {
      'GR1' => { name: 'Green tea', price: 3.11 },
      'SR1' => { name: 'Strawberries', price: 5.00 },
      'CF1' => { name: 'Coffee', price: 11.23 }
    }

    @pricing_rules = [
      PricingRules::CEORule,
      PricingRules::COORule,
      PricingRules::CTORule
    ]

    @checkout = Checkout.new(@pricing_rules, @products)
  end

  def test_scan_and_total_no_rules
    @checkout.scan('GR1')
    @checkout.scan('SR1')
    @checkout.scan('CF1')

    assert_equal 19.34, @checkout.total
  end

  def test_scan_and_total_with_ceo_rule
    @checkout.scan('GR1')
    @checkout.scan('GR1')

    assert_equal 3.11, @checkout.total
  end

  def test_scan_and_total_with_coo_rule
    @checkout.scan('SR1')
    @checkout.scan('SR1')
    @checkout.scan('SR1')

    assert_equal 13.5, @checkout.total
  end

  def test_scan_and_total_with_cto_rule
    @checkout.scan('CF1')
    @checkout.scan('CF1')
    @checkout.scan('CF1')

    assert_equal 22.46, @checkout.total
  end

  def test_scan_and_total_with_multiple_rules
    @checkout.scan('GR1')  # Green tea
    @checkout.scan('GR1')  # Green tea (free)
    @checkout.scan('SR1')  # Strawberries
    @checkout.scan('SR1')  # Strawberries
    @checkout.scan('SR1')  # Strawberries (bulk discount applies)
    @checkout.scan('CF1')  # Coffee

    assert_equal 27.84, @checkout.total
  end
end
