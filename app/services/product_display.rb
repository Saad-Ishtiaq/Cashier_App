module ProductDisplay
  def self.show(products)
    puts "\nAvailable Products:"
    products.each do |code, details|
      puts "#{code}: #{details[:name]} - £#{details[:price]}"
    end
    puts
  end
end
