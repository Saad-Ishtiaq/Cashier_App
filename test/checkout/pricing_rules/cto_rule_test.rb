require_relative '../../../test/test_helper'

class CTORuleTest < Minitest::Test
  def test_eligibility
    assert PricingRules::CTORule.eligible?('CF1', 3)
    assert PricingRules::CTORule.eligible?('CF1', 5)

    refute PricingRules::CTORule.eligible?('CF1', 2)
    refute PricingRules::CTORule.eligible?('GR1', 3)
  end

  def test_apply
    # 3 items: £11.23 * 2/3 * 3 = £22.46
    assert_in_delta 22.46, PricingRules::CTORule.apply(3, 11.23), 0.01

    # 5 items: £11.23 * 2/3 * 5 ≈ £37.43
    assert_in_delta 37.43, PricingRules::CTORule.apply(5, 11.23), 0.01
  end
end
