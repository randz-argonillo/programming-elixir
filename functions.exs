
list_concat = fn([a, b], [c, d]) -> [a, b] ++ [c, d] end
IO.puts inspect(list_concat.([:a,:b], [:c,:d]))

sum = fn(a,b, c) -> a + b + c end
IO.puts sum.(1,2,3)

pair_tuple_to_list = fn({ a, b }) -> [a, b] end
IO.puts inspect pair_tuple_to_list.({ 123,456 })

handle_file_open = fn
  { :ok, file } -> "Read data: #{IO.read(file, :line)}"
  { _, error } -> "Error: #{:file.format_error(error)}"
end

IO.puts handle_file_open.(File.open("hello.exs"))
IO.puts handle_file_open.(File.open("not exist.txt"))

fizz_buzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, c) -> c
end

test_buzz = fn(n) ->
  fizz_buzz.(rem(n, 3), rem(n, 5), n)
end

greeter = fn(name) -> (fn(greet) -> "#{greet} #{name}" end) end
randy_greeter = greeter.("Randy")
IO.puts randy_greeter.("Hi")
IO.puts randy_greeter.("Hello")

add_by = fn base -> (fn num -> base + num end) end
add_2 = add_by.(2)
IO.puts add_2.(5)

prefix = fn pre -> (fn name -> "#{pre}. #{name}" end) end
mr_prefix = prefix.("Mr")
IO.puts mr_prefix.("Randy")

times = fn n -> (fn num -> num * n end) end
times2 = times.(2)
apply = fn(fun, val) -> fun.(val) end

IO.puts apply.(times2, 4)

list = [1,3,5,7,9]
IO.inspect(Enum.map(list, times2))
IO.puts inspect(Enum.map(list, &(&1 + 1)))
IO.puts Enum.map(list, &IO.inspect/1)
