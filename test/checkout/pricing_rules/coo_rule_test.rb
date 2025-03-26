require_relative '../../../test/test_helper'

class COORuleTest < Minitest::Test
  def test_eligibility
    assert PricingRules::COORule.eligible?('SR1', 3)
    assert PricingRules::COORule.eligible?('SR1', 5)

    refute PricingRules::COORule.eligible?('SR1', 2)
    refute PricingRules::COORule.eligible?('GR1', 3)
  end

  def test_apply
    assert_equal 13.5, PricingRules::COORule.apply(3, 5.0)
    assert_equal 22.5, PricingRules::COORule.apply(5, 5.0)
  end
end
