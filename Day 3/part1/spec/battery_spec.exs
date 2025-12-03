defmodule BatterySpec do
  use ESpec

  describe "Battery.max_joltage/1" do
    it "returns 98 as the maximum joltage for 987654321111111" do
      expect(Battery.max_joltage("987654321111111")) |> to(eq 98)
    end

    it "returns 89 as the maximum joltage for 811111111111119" do
      expect(Battery.max_joltage("811111111111119")) |> to(eq 89)
    end

    it "returns 78 as the maximum joltage for 234234234234278" do
      expect(Battery.max_joltage("234234234234278")) |> to(eq 78)
    end

    it "returns 92 as the maximum joltage for 818181911112111" do
      expect(Battery.max_joltage("818181911112111")) |> to(eq 92)
    end
  end
end
