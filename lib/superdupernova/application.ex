defmodule Superdupernova.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SuperdupernovaWeb.Telemetry,
      Superdupernova.Repo,
      {DNSCluster, query: Application.get_env(:superdupernova, :dns_cluster_query) || :ignore},
      {Oban,
       AshOban.config(
         Application.fetch_env!(:superdupernova, :ash_domains),
         Application.fetch_env!(:superdupernova, Oban)
       )},
      {Phoenix.PubSub, name: Superdupernova.PubSub},
      # Start a worker by calling: Superdupernova.Worker.start_link(arg)
      # {Superdupernova.Worker, arg},
      # Start to serve requests, typically the last entry
      SuperdupernovaWeb.Endpoint,
      {AshAuthentication.Supervisor, [otp_app: :superdupernova]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Superdupernova.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SuperdupernovaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
