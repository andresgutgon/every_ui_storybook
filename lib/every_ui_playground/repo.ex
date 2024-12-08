defmodule EveryUiPlayground.Repo do
  use Ecto.Repo,
    otp_app: :every_ui_playground,
    adapter: Ecto.Adapters.Postgres
end
