defmodule SetlistApp.Request do
  @api Application.get_env(:setlist_app, :api)
  # alias SetlistApp.Main.Api

  @spec get_artists(String.t()) :: {:ok, list()}
  def get_artists(name) do
    {:ok, %{"artist" => artists}} = @api.fetch(name)

    {:ok, artists}
  end
end
