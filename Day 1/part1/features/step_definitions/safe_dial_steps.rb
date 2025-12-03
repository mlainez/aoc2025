Given('the dial is positioned at {int}') do |position|
  @safe_dial = SafeDial.new(position)
end

When('I turn the dial {word} by a distance of {int}') do |direction, distance|
  @safe_dial.turn(direction: direction.to_sym, distance: distance)
end

Then('I should end up at the position {int}') do |position|
  expect(@safe_dial.position).to be position
end

Then('the password should be {int}') do |int|
  expect(@safe_dial.password).to be 3
end