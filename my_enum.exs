defmodule MyList do
  def all?([], _func), do: true
  def all?([head | tail], func) do
   func.(head) and all?(tail, func)
  end

  def each([], _func), do: nil
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end
end
