date1 = Date.new(2018, 08, 12)
IO.inspect date1

{ :ok, date2 } = Date.new(2018, 08, 12);
IO.inspect date2
inspect date2, struct: false

IO.puts date2 === ~D[2018-08-12]

date3 = Date.range(~D[2018-01-30], ~D[2018-08-30])

IO.puts date2 in date3
