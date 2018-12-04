defmodule Aoc.Day.One.Part1 do
  def run do
    File.stream!("priv/data/dayone.txt")
    |> Enum.map(&String.replace(&1, "\n", ""))
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce(0, &(&2 + &1))
  end
end
