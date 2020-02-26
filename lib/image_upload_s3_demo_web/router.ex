defmodule ImageUploadS3DemoWeb.Router do
  use ImageUploadS3DemoWeb, :router

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

  scope "/", ImageUploadS3DemoWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/images", ImageController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ImageUploadS3DemoWeb do
  #   pipe_through :api
  # end
end
