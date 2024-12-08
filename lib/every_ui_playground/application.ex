defmodule EveryUiPlayground.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EveryUiPlaygroundWeb.Telemetry,
      EveryUiPlayground.Repo,
      {DNSCluster, query: Application.get_env(:every_ui_playground, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: EveryUiPlayground.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: EveryUiPlayground.Finch},
      # Start a worker by calling: EveryUiPlayground.Worker.start_link(arg)
      # {EveryUiPlayground.Worker, arg},
      # Start to serve requests, typically the last entry
      EveryUiPlaygroundWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EveryUiPlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EveryUiPlaygroundWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
