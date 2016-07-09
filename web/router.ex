defmodule Soapbox.Router do
  use Soapbox.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Soapbox do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", Soapbox do
    pipe_through :api

    get "/now_playing", MovieController, :now_playing
    get "/coming_soon", MovieController, :coming_soon
  end
  # Other scopes may use custom stacks.
  # scope "/api", Soapbox do
  #   pipe_through :api
  # end
end
