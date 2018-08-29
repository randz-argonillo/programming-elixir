[1,2,3,4,5]
|> Stream.map(&(&1 * &1))
|> Enum.to_list
|> inspect
|> IO.puts

1..10_000_000
|> Stream.map(&(&1 + 1))
|> Enum.take(5)
|> inspect
|> IO.puts

Stream.cycle(~w{ green blue })
|> Stream.zip(1..5)
|> Enum.map(fn { class, value } -> "<tr class=#{class}><td>#{value}</td></tr>\n" end)
# |> Enum.to_list
# |> Enum.join
# |> inspect
|> IO.puts

Stream.repeatedly(fn -> true end)
|> Enum.take(5)
|> inspect
|> IO.puts

Stream.iterate(2, &(&1 + &1))
|> Enum.take(10)
|> inspect
|> IO.puts

Stream.unfold({ 0, 1 }, fn { f1, f2 } -> {f1, {f2, f1 + f2}} end)
|> Enum.take(15)
|> inspect
|> IO.puts

Stream.resource(
  fn -> File.open!("./enum.exs") end,
  fn file ->
    case IO.read(file, :line) do
      data when is_binary(data) -> { [data], file }
      _ -> { :halt, file }
    end
  end ,
  fn file -> File.close(file) end)
|> Enum.each(&IO.puts/1)
