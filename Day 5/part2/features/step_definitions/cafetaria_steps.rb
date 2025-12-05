Given('the following inventory database:') do |doc_string|
  @inventory_scanner = InventoryScanner.new(doc_string)
end

Then('{int} should be marked as fresh') do |int|
  @inventory_scanner.fresh_products.include?(int).should be true
end

Then('{int} should not be marked as fresh') do |int|
  @inventory_scanner.fresh_products.include?(int).should be false
end

Then('{int} ingredient IDs should be considered fresh') do |int|
  @inventory_scanner.fresh_product_id_count.should eq int
end