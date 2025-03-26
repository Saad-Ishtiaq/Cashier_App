require_relative 'base_rule'

module PricingRules
  class CEORule < BaseRule
    def self.eligible?(item_code, quantity)
      item_code == 'GR1' && quantity >= 2
    end

    def self.apply(quantity, price)
      (quantity.to_f / 2).ceil * price
    end
  end
end
