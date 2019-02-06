use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :setlist_app, SetlistAppWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :setlist_app, SetlistApp.Repo,
  username: "postgres",
  password: "postgres",
  database: "setlist_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :setlist_app, :api, SetlistApp.Main.Api.Mock
