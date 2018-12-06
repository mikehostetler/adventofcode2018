defmodule Aoc.Day.Two.Part1 do
  require IEx
    def run() do
      {twice, thrice} = File.stream!("priv/data/daytwo.txt")
        |> Stream.map(&String.replace(&1, "\n", ""))
        #|> Stream.cycle()
        |> Enum.reduce({[], []}, fn x, {twice, thrice} ->
          {x_twice, x_thrice} = countCharInString(to_charlist x)

          IO.puts("String #{x} has twice: #{x_twice} and thrice: #{x_thrice}")
          {Enum.uniq(x_twice ++ twice), Enum.uniq(x_thrice ++ thrice)}
        end)

        Enum.count(twice) * Enum.count(thrice)

    end

    def countCharInString(string) do
      {_, twice, thrice} = Enum.reduce(string, {[], [], []}, fn x, {once, twice, thrice} ->
        cond do
          x in once -> 
            {once -- [x], [x | twice], thrice}
          x in twice ->
            {once, twice -- [x], [x | thrice]}
          x in thrice ->
            {once, twice, thrice -- [x]}
          x not in once ->
            {[x | once], twice, thrice}
        end
      end)
      {min(Enum.count(twice), 1), min(Enum.count(thrice),1)}
    end
  end

# """
# vtnihorkulbfvjcyzmsjgdxplw
# vtnihorvujbfejcyzmsqgdlpaw
# vtnihoriulbzejcyzmsrgdxpaw
# vtsihowkulbfejcyzmszgdxpaw
# vtnizorkunbfejcyzmsqgdypaw
# """

# "vtnihorkulbfvjcyzmsjgdxplw"

# {"a", seen_twice, seen_thrice}

# ["v", "t", "n", "i" ... "w"]

# {v: 2, t: 1, n: 3 ... }



