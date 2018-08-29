defmodule Issues.GithubIssues do
  @github_url Application.get_env(:issues, :github_url)

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get
    |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({_, %HTTPoison.Response{status_code: status, body: body}}) do
    {
      status |> normalize_status,
      body |> Poison.decode!
    }
  end

  def handle_response({:error, %HTTPoison.Error{reason: error}}) do
    {:error, error}
  end

  def normalize_status(200), do: :ok
  def normalize_status(_), do: :error
end
