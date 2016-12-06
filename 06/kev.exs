defmodule Advent06 do
  def hist_at([],_x), do: %{}

  def hist_at([h|t],x) do
    letter = String.at(h,x)
    sofar = hist_at(t,x)
    Map.merge(sofar, %{letter => (sofar[letter] || 0) + 1})
  end

  def common_at(list,x, option \\ :most) do
    multiplier = if (option == :least), do: -1, else: 1
    hist_at(list,x)
    |> Enum.max_by(fn(x) -> multiplier * elem(x,1) end)
    |> elem(0)
  end
end

signal = Enum.to_list(File.stream!("kev.txt"))
p1 = Enum.map(0..7, fn(x)-> Advent06.common_at(signal,x) end)
p2 = Enum.map(0..7, fn(x)-> Advent06.common_at(signal,x,:least) end)
IO.puts "Part One: #{p1}"
IO.puts "Part Two: #{p2}"
