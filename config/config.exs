# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :one_six_demo,
  ecto_repos: [OneSixDemo.Repo]

# Configures the endpoint
config :one_six_demo, OneSixDemoWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: OneSixDemoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: OneSixDemo.PubSub,
  live_view: [signing_salt: "5xelAE7o"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :one_six_demo, OneSixDemo.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# For Tz
config :one_six_demo, env: Mix.env()

config :elixir, :time_zone_database, Tz.TimeZoneDatabase

config :tz,
  reject_time_zone_periods_before_year: 2010,
  build_time_zone_periods_with_ongoing_dst_changes_until_year: 20 + NaiveDateTime.utc_now().year

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
