defmodule Users do
  dave = %{ name: "Dave", state: "TX", likes: "Programming" }
  case dave do
    %{ state: some_state } = person -> IO.puts "#{person.name} lives in #{some_state}"
    _ -> "No matches"
  end
end
