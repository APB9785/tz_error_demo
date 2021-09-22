import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :one_six_demo, OneSixDemo.Repo,
  username: "postgres",
  password: "postgres",
  database: "one_six_demo_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :one_six_demo, OneSixDemoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "oigc3JZtUa1E32X2wSixfseAmnwkpjIIxISr+ZakW+xx3rZBRKPapPbr8bJv5DN4",
  server: false

# In test we don't send emails.
config :one_six_demo, OneSixDemo.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
