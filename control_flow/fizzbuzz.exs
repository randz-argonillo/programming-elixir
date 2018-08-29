defmodule FizzBuzz do
  def upto(n) do
    1..n |> Enum.map(fn n -> fizz_buzz rem(n, 3), rem(n, 5), n end)
  end

  defp fizz_buzz(0, 0, _), do: "FizzBuzz"
  defp fizz_buzz(0, _, _), do: "Fizz"
  defp fizz_buzz(_, 0, _), do: "Buzz"
  defp fizz_buzz(_, _, n), do: n
end
