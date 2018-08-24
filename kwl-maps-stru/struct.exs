defmodule Subscriber do
  defstruct name: '', paid: false, over_18: false
end

defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end

report = %BugReport{ owner: %Customer{ name: "rargonillo", company: "apple" }, details: "There is a bug" }
IO.puts inspect(report)

r2 = put_in(report.owner.company, "PragProg")
IO.puts inspect(r2)
