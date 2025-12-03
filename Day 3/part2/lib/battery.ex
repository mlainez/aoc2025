defmodule Battery do
  def max_joltage(battery_joltages) when is_binary(battery_joltages) do
    parse_digits(battery_joltages)
    |> max_subsequence(12)
    |> digits_to_integer()
  end

  defp parse_digits(number_string) do
    number_string
    |> String.trim()
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end

  defp max_subsequence(digits, size) when is_list(digits) and is_integer(size) and size > 0 do
    pick_subsequence(digits, size, [])
    |> Enum.reverse()
  end

  defp pick_subsequence(_digits, 0, acc), do: acc

  defp pick_subsequence(digits, size, acc) do
    remaining = length(digits)
    last_index = remaining - size
    {candidates, _rest} = Enum.split(digits, last_index + 1)

    {best_digit, index_in_candidates} =
      candidates
      |> Enum.with_index()
      |> Enum.max_by(fn {d, _idx} -> d end)

    {_skipped, tail} = Enum.split(digits, index_in_candidates + 1)

    pick_subsequence(tail, size - 1, [best_digit | acc])
  end

  defp digits_to_integer(digits) when is_list(digits) do
    Enum.reduce(digits, 0, fn d, acc -> acc * 10 + d end)
  end
end
