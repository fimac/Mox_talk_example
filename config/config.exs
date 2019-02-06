# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :setlist_app,
  ecto_repos: [SetlistApp.Repo]

# Configures the endpoint
config :setlist_app, SetlistAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "T6GDlSja1tlxHJb60CH/a7axvUhOBiNC9kiSeC9nqonP31+3WQGIjTB5gj8nHSNj",
  render_errors: [view: SetlistAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SetlistApp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :setlist_app, :api, SetlistApp.Main.Api

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
