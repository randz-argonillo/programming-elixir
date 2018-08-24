import IO, only: [puts: 1]
require Integer

defmodule Util do
  def display(any), do: puts(inspect any)
end

Util.display Enum.to_list(1..10)

Util.display Enum.concat([1,2,3], [4,5,6])

Util.display Enum.map([2,4,6,8,10], &String.duplicate("*", &1))

Util.display Enum.filter(1..100, &Integer.is_even/1)

Util.display Enum.at(23..50, 10)

Util.display Enum.reject(1..100, &Integer.is_even/1)

Util.display Enum.sort(["there", "was", "a", "crooked", "man"])

Util.display Enum.sort(["there", "was", "a", "crooked", "man"], &(String.length(&1) <= String.length(&2)))

Util.display Enum.max(["there", "was", "a", "crooked", "man"])

Util.display Enum.max_by(["there", "was", "a", "crooked", "man"], &String.length/1)

Util.display Enum.join(1..4, ", ")

Util.display Enum.empty?([])

Util.display Enum.member?(1..5, 4 )

Util.display Enum.zip([:a, :b, :c], 1..3)

Util.display Enum.zip(1..3, [:a, :b, :c])

[1,2,3,4,5]
|> Enum.map(&(&1 * &1))
|> Enum.with_index
|> Enum.map(fn { value, index } -> value - index end)
|> Util.display
