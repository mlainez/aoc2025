require_relative 'inventory_scanner.rb'

inventory = ""
File.foreach("input.txt") do |line|
  inventory += line
end

puts inventory

inventory_scanner = InventoryScanner.new(inventory)
puts "Total fresh products: #{inventory_scanner.fresh_product_ids.count}"
