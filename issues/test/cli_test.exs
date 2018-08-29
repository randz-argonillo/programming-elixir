defmodule CLITest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [parse_args: 1, sort_descending: 1]

  test "-h and --h flags will return :help" do
    assert parse_args(["-h"]) == :help
    assert parse_args(["--help"]) == :help
  end

  test "-h and --h flags with args will return :help" do
    assert parse_args(["-h", "sdf"]) == :help
    assert parse_args(["--help", "sdf"]) == :help
  end

  test "pass with three args will return the arguments" do
    assert parse_args(["rargonillo", "elixir", "1"]) == {"rargonillo", "elixir", 1}
  end

  test "pass with two args will return the two arguments with a default value for third item" do
    assert parse_args(["rargonillo", "elixir"]) == {"rargonillo", "elixir", 4}
  end

  test "correct desceding of items" do
    result = sort_descending get_fake_items(~w{ c a b })
    actual = for item <- result, do: item["created_at"]
    assert actual == ~w{ c b a }
  end

  defp get_fake_items(items) do
    Enum.map(items, &(%{ "created_at" => &1 }))
  end
end
