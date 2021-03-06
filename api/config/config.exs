# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :stracker,
  ecto_repos: [Stracker.Repo]

# Configures the endpoint
config :stracker, Stracker.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "b/ulMFBPmMYX3JplG4H0nUJk2l2FTvYFzrpTixZMHNuxDhmPT0ZfPiu8rn/w9Lwb",
  render_errors: [view: Stracker.ErrorView, accepts: ~w(json)],
  pubsub: [name: Stracker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

  config :guardian, Guardian,
  issuer: "Stracker",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: Stracker.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
