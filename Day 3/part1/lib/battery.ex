defmodule Battery do
  def max_joltage(batteryJoltages) when is_binary(batteryJoltages) do
    parse_digits(batteryJoltages)
    |> find_all_digit_pairs()
    |> Enum.map(&combine_digits/1)
    |> Enum.max()
  end

  defp parse_digits(number_string) do
    number_string
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end

  defp find_all_digit_pairs(digits) do
    0..(length(digits) - 2)
    |> Enum.map(fn position ->
      first_digit = Enum.at(digits, position)
      digits_after = Enum.drop(digits, position + 1)
      largest_after = Enum.max(digits_after)

      {first_digit, largest_after}
    end)
  end

  defp combine_digits({first, second}) do
    first * 10 + second
  end
end
