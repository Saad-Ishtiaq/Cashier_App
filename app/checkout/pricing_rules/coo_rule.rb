require_relative 'base_rule'

module PricingRules
  class COORule < BaseRule
    def self.eligible?(item_code, quantity)
      item_code == 'SR1' && quantity >= 3
    end

    def self.apply(quantity, _price)
      quantity * 4.50
    end
  end
end
