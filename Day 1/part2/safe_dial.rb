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
      new_position = (@position - distance) % 100
      if @position == 0
        @password += distance / 100
      elsif @position <= distance
        @password += 1 + (distance - @position) / 100
      else
        @password += distance / 100
      end
    when :right
      new_position = (@position + distance) % 100
      if new_position == 0
        @password += (@position + distance) / 100
      else
        @password += (@position + distance - 1) / 100
      end
    else
      raise ArgumentError, "Invalid direction: #{direction}"
    end
    @position = new_position
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