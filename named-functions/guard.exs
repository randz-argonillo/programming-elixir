defmodule Guard do
  def what_is(n) when is_number(n) do
    IO.puts "#{n} is number"
  end

  def what_is(n) when is_list(n) do
    IO.puts "#{inspect(n)} is list"
  end

  def what_is(n) when is_atom(n) do
    IO.puts "#{n} is atom"
  end
end
