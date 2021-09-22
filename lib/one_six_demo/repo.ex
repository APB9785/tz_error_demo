defmodule OneSixDemo.Repo do
  use Ecto.Repo,
    otp_app: :one_six_demo,
    adapter: Ecto.Adapters.Postgres
end
