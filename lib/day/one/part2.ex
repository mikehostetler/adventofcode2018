defmodule Aoc.Day.One.Part2 do
  require IEx

  def run do
    File.stream!("priv/data/dayone.txt")
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&String.to_integer/1)
    |> Stream.cycle()
    |> Enum.reduce_while({0, [0]}, fn x, {curr_freq, seen_freq} ->
      new_freq = x + curr_freq

      if new_freq in seen_freq do
        {:halt, new_freq}
      else
        {:cont, {new_freq, [new_freq | seen_freq]}}
      end
    end)
  end
end
