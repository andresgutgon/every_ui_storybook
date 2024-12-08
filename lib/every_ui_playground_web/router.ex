defmodule EveryUiPlaygroundWeb.Router do
  use EveryUiPlaygroundWeb, :router
  import PhoenixStorybook.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {EveryUiPlaygroundWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    storybook_assets()
  end

  scope "/", EveryUiPlaygroundWeb do
    pipe_through :browser

    live_storybook("/", backend_module: EveryUiPlaygroundWeb.Storybook)
  end
end
