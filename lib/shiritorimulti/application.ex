defmodule Shiritorimulti.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ShiritorimultiWeb.Telemetry,
      # Start the Ecto repository
      Shiritorimulti.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Shiritorimulti.PubSub},
      # Start Finch
      {Finch, name: Shiritorimulti.Finch},
      # Start the Endpoint (http/https)
      ShiritorimultiWeb.Endpoint
      # Start a worker by calling: Shiritorimulti.Worker.start_link(arg)
      # {Shiritorimulti.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Shiritorimulti.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ShiritorimultiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
