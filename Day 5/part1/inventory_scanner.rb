class InventoryScanner
  attr_reader :fresh_product_ids

  def initialize(doc_string)
    @fresh_product_ids, @product_ids, @ranges = [], [], []
    @database = doc_string.lines.map do |line|
      if line.include?('-')
        range_as_array = line.split('-')
        @ranges << [range_as_array[0].strip.to_i, range_as_array[1].strip.to_i]
      elsif line.strip.empty?
        next
      else
        @product_ids << line.strip.to_i
      end
    end
    scan_inventory
  end

  private
  def scan_inventory
    @ranges.each do |low, high|
      @product_ids.each do |id|
        @fresh_product_ids << id if low <= id && id <= high
      end
    end
    @fresh_product_ids.uniq!
  end
end