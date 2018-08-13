defmodule KrabbytimeWeb.Router do
  use KrabbytimeWeb, :router

  pipeline :redirecter do
    plug :accepts, ["*"]
  end

  # Our primary KrabbyTime api based on redirects.
  scope "/" do
    pipe_through :redirecter

    get "/seconds/:seconds", KrabbytimeWeb.SecondsController, :show
  end
end
