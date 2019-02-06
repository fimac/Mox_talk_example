defmodule SetlistApp.Repo do
  use Ecto.Repo,
    otp_app: :setlist_app,
    adapter: Ecto.Adapters.Postgres
end
