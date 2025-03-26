module PricingRules
  # Abstract base class defining the interface for pricing rules.
  # This enforces consistent rule implementation while allowing
  # flexible strategy variations for different products.
  class BaseRule
    def self.applies_to?(_item_code)
      raise NotImplementedError, 'Implement in child class'
    end

    def self.apply(_quantity, _price)
      raise NotImplementedError, 'Implement in child class'
    end
  end
end
