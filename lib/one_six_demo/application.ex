defmodule OneSixDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children =
      [
        # Start the Ecto repository
        OneSixDemo.Repo,
        # Start the Telemetry supervisor
        OneSixDemoWeb.Telemetry,
        # Start the PubSub system
        {Phoenix.PubSub, name: OneSixDemo.PubSub},
        # Start the Endpoint (http/https)
        OneSixDemoWeb.Endpoint
        # Start a worker by calling: OneSixDemo.Worker.start_link(arg)
        # {OneSixDemo.Worker, arg}
      ]
      |> append_if(Application.get_env(:one_six_demo, :env) != :test, {Tz.UpdatePeriodically, []})

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OneSixDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OneSixDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp append_if(list, condition, item) do
    if condition, do: list ++ [item], else: list
  end
end
