class InventoryScanner
  attr_reader :fresh_products

  def initialize(doc_string)
    @fresh_products, @product_ids, @ranges = [], [], []
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

  def fresh_product_id_count
    range_map     = @ranges.map { |range| (range[0]..range[1]) }
    sorted_ranges = range_map.sort_by(&:first)

    current_start = sorted_ranges[0].first
    current_end   = sorted_ranges[0].last
    merged_ranges = []
    sorted_ranges.each_with_index do |range, index|
      next if index == 0
      next_start  = range.first
      next_end    = range.last

      if next_start <= current_end + 1
        current_end = [current_end, next_end].max
      else
        merged_ranges << (current_start..current_end)
        current_start = next_start
        current_end   = next_end
      end
    end
    merged_ranges << (current_start..current_end)
    merged_ranges.sum(&:size)
  end

  private
  def scan_inventory
    @ranges.each do |low, high|
      @product_ids.each do |id|
        @fresh_products << id if low <= id && id <= high
      end
    end
    @fresh_products.uniq!
  end
end