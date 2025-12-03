defmodule BatterySpec do
  use ESpec

  describe "Battery.max_joltage/1" do
    it "returns 987654321111 as the maximum joltage for 987654321111111" do
      expect(Battery.max_joltage("987654321111111")) |> to(eq 987654321111)
    end

    it "returns 811111111119 as the maximum joltage for 811111111111119" do
      expect(Battery.max_joltage("811111111111119")) |> to(eq 811111111119)
    end

    it "returns 434234234278 as the maximum joltage for 234234234234278" do
      expect(Battery.max_joltage("234234234234278")) |> to(eq 434234234278)
    end

    it "returns 888911112111 as the maximum joltage for 818181911112111" do
      expect(Battery.max_joltage("818181911112111")) |> to(eq 888911112111)
    end
  end
end
