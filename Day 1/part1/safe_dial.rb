class SafeDial
  attr_reader :position
  attr_reader :password

  def initialize(position, password = 0)
    @position = position
    @password = password
  end

  def turn(direction:, distance:)
    case direction
    when :left
      @position = (@position - distance) % 100
    when :right
      @position = (@position + distance) % 100
    else
      raise ArgumentError, "Invalid direction: #{direction}"
    end
    @password += 1 if @position == 0
  end
end


safe = SafeDial.new(50)
File.foreach('input_file.txt') do |line|
  line = line.strip
  next if line.empty?
  direction = line[0] == 'R' ? :right : :left
  distance = line[1..-1].to_i
  safe.turn(direction: direction, distance: distance)
end
puts "Password:" + safe.password.to_s