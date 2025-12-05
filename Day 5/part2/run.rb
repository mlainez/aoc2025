require_relative 'inventory_scanner.rb'

inventory = ""
File.foreach("input.txt") do |line|
  inventory += line
end

inventory_scanner = InventoryScanner.new(inventory)
puts "Total fresh products IDs: #{inventory_scanner.fresh_product_id_count}"
