defmodule Default do
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.puts inspect([p1, p2, p3, p4])
  end

  def func2(p1, p2 \\ 3)

  def func2(p1, 99) do
    IO.puts inspect([p1, 99])
  end

  def func2(p1, p2) do
    IO.puts inspect([p1, p2])
  end
end

IO.puts Default.func("a", "b", "c")

IO.puts Default.func2(1, 2)

IO.puts Default.func2(2, 99)

IO.puts Default.func2(2)
