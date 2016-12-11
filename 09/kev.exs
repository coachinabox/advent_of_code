defmodule Advent9 do
  def parse([h|t]) when h == "(" do
    a = Enum.take_while(t,fn(x) -> x != ")" end)
    [{l,_},{m,_}] = Enum.join(a) |> String.split("x") |> Enum.map(fn(x) -> Integer.parse(x) end)
    the_rest = Enum.drop(t, Enum.count(a) + 1)
    (l * m) + parse(Enum.drop(the_rest, l))
  end

  def parse([]), do: 0

  def parse([_|t]), do: 1 + parse(t)
end

{:ok, file} = File.open('kev.txt')
input = String.split(IO.read(file, :line),"")
IO.puts("Part One: #{Advent9.parse(input)}")
