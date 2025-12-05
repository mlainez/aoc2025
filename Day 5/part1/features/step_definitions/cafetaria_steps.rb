Given('the following inventory database:') do |doc_string|
  @inventory_scanner = InventoryScanner.new(doc_string)
end

Then('{int} should be marked as fresh') do |int|
  @inventory_scanner.fresh_product_ids.include?(int).should be true
end

Then('{int} should not be marked as fresh') do |int|
  @inventory_scanner.fresh_product_ids.include?(int).should be false
end