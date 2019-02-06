defmodule SetlistApp.Main.Api do
  @behaviour SetlistApp.Main.ApiBehaviour

  @spec fetch(String.t()) :: {:ok, map()}
  def fetch(name) do
    url = "https://api.setlist.fm/rest/1.0/search/artists?&artistName=#{name}"

    headers = [
      {"Accept", "application/json"},
      {"x-api-key", "get an api key from setlistfm and add it here"}
    ]

    response =
      HTTPoison.get!(url, headers)
      |> Map.get(:body)
      |> Jason.decode!()

    {:ok, response}
  end
end
