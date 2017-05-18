defmodule Pocapi.Router do
  use Pocapi.Web, :router

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

  scope "/", Pocapi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/products", ProductController
  end

  scope "/api", Pocapi do
    pipe_through :api
    resources "/products", ProductController, only: [:index, :show, :create, :update, :delete]
  end
end
