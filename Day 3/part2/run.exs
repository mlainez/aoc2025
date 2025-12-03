Code.compile_file("lib/battery.ex")

"input.txt"
|> File.read!()
|> String.split("\n", trim: true)
|> Enum.map(fn line ->
  joltage = Battery.max_joltage(line)
  joltage
end)
|> Enum.sum()
|> then(fn total_joltage ->
  IO.puts("Total maximum joltage: #{total_joltage}")
end)
