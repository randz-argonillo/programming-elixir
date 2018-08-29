defmodule Issues.CLI do
  @moduledoc """
  Handle the command line parsing and the dispatch to
  the various functions that end up generating a
  table of the last _n_ issues in a github project
  """

  @default_count 4

  def main(argv) do
    argv
    |> parse_args
    |> process
    |> table_print(["number", "created_at", "title"])
  end

  @doc """
  'argv' can be -h or --help, which returns :help.
  Otherwise it is a github user name, project name, and (optionally)
  the number of entries to format.
  Return a tuple of `{ user, project, count }`, or `:help` if help was given.
  """
  def parse_args(argv) do
    OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])
    |> elem(1)
    |> parse
  end

  def parse([user, project, count]) do
    {user, project, String.to_integer(count)}
  end

  def parse([user, project]) do
    {user, project, @default_count}
  end

  def parse(_), do: :help

  def process(:help) do
    IO.puts """
    usage: issues <user> <project> [count | #{@default_count}]
    """
  end

  def process({user, project, count}) do
    Issues.GithubIssues.fetch(user, project)
    |> decode
    |> sort_descending
    |> take_top(count)
  end

  def decode({ :ok, body }), do: body
  def decode({ :error, error }) do
    "Error fetching from Github: #{error}"
    System.halt(2)
  end

  def sort_descending(items) do
    items
    |> Enum.sort(&(&1["created_at"] > &2["created_at"]))
  end

  def take_top(items, count) do
    items
    |> Enum.take(count)
    |> Enum.reverse
  end

  def table_print(items, columns) do
    items
    |> Enum.map(&create_row(&1, columns))
    |> Scribe.print(data: columns) #sdata: cols_to_atoms(columns))
  end

  defp create_row(item, columns) do
    columns
    |> Enum.reduce(%{}, fn col, acc -> Map.put(acc, col, item[col])  end )
  end

end
