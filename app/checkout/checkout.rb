class Checkout
  def initialize(pricing_rules, products)
    @pricing_rules = pricing_rules
    @products = products
    @cart = Hash.new(0)
  end

  def scan(item_code)
    @cart[item_code] += 1 if @products.key?(item_code)
  end

  def total
    total_price = 0.0
    @cart.each do |item_code, quantity|
      product = @products[item_code]
      price = product[:price]
      rule = @pricing_rules.find { |r| r.eligible?(item_code, quantity) }
      item_total = rule ? rule.apply(quantity, price) : quantity * price
      total_price += item_total
    end
    total_price.round(2)
  end
end
