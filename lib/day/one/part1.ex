defmodule Aoc.Day.One.Part1 do
  def run do
    File.stream!("priv/data/dayone.txt")
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&String.to_integer/1)
    |> Enum.reduce(0, &(&2 + &1))
  end
end
