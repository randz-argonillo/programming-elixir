
defmodule Util do
  def show(any), do: IO.puts inspect(any)
end

Util.show for x <- [1,2,3,4,5], do: x * x

min_maxes = [{1,5}, {6, 10}, {20, 50}]
Util.show for { min, max } <- min_maxes, n <- min..max, do: n

