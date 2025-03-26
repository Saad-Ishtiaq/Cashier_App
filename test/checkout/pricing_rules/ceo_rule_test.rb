require_relative '../../../test/test_helper'

class CEORuleTest < Minitest::Test
  def test_eligibility
    assert PricingRules::CEORule.eligible?('GR1', 2)
    assert PricingRules::CEORule.eligible?('GR1', 3)

    # Trying with wrong Code
    refute PricingRules::CEORule.eligible?('SR1', 2)
    # Trying with wrong Quantity
    refute PricingRules::CEORule.eligible?('GR1', 1)
  end

  def test_apply
    # for 2 items → it should give us price of 1
    assert_equal 3.11, PricingRules::CEORule.apply(2, 3.11)
    # for 3 items → it should give us price of 2
    assert_equal 6.22, PricingRules::CEORule.apply(3, 3.11)
    # for 1 item → it should not be eligible (I am trying to test edge case)
    assert_equal 3.11, PricingRules::CEORule.apply(1, 3.11)
  end
end
