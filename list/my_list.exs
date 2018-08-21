defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]

  def add_1([]), do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]

  def map([], _func), do: []
  def map([head | tail], func), do: [ func.(head) | map(tail, func) ]

  def reduce([], value, _func), do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(value, head), func)

  def max(list), do: reduce(list, 0, &((&1 > &2 and &1) || &2 ))
end
