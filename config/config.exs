# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_multi_db,
  ecto_repos: [PhoenixMultiDb.Repo]

# Configures the endpoint
config :phoenix_multi_db, PhoenixMultiDb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3p++3gywPcRv28CQvp69zr3C2xy5RtQ+7wFYqSymJyoTAtVW7f/X7sPs9Q7Z2BJG",
  render_errors: [view: PhoenixMultiDb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixMultiDb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
