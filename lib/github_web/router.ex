defmodule GithubWeb.Router do
  use GithubWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  scope "/", GithubWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", GithubWeb do
    pipe_through :api

    # Endpoint for user information
    resources "/data", DatumController, only: [:index, :show]

    # Endpoint for starred repo information
    resources "/starred", StarredController, only: [:index, :show]
  end
end
