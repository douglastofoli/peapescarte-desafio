defmodule Peapescarte.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PeapescarteWeb.Telemetry,
      # Start the Ecto repository
      Peapescarte.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Peapescarte.PubSub},
      # Start Finch
      {Finch, name: Peapescarte.Finch},
      # Start the Endpoint (http/https)
      PeapescarteWeb.Endpoint,
      # Start a worker by calling: Peapescarte.Worker.start_link(arg)
      # {Peapescarte.Worker, arg}

      {Peapescarte.RunTask, 1..100_000_000},
      {Peapescarte.Api, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Peapescarte.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PeapescarteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
