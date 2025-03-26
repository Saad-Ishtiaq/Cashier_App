require_relative 'base_rule'

module PricingRules
  class CTORule < BaseRule
    def self.eligible?(item_code, quantity)
      item_code == 'CF1' && quantity >= 3
    end

    def self.apply(quantity, price)
      (quantity * (price * 2 / 3)).round(2)
    end
  end
end
