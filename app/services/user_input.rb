module UserInput
  def self.ask_for_products(products)
    puts "Bucket: Enter product codes separated by commas (e.g., 'GR1, SR1'):"
    input = gets.chomp
    product_codes = input.split(',').map { |code| code.strip.upcase }

    valid_codes = product_codes.select { |code| products.key?(code) }
    invalid_codes = product_codes - valid_codes

    puts "\nSorry, we don't have these products: #{invalid_codes.join(', ')}" if invalid_codes.any?

    if valid_codes.empty?
      puts 'No valid products. Try again.'
      ask_for_products(products)
    else
      puts "\nAdded to bucket:"
      valid_codes.each { |code| puts "- #{products[code][:name]}" }
      valid_codes
    end
  end
end
