defmodule KrabbytimeWeb.SecondsController do
  use KrabbytimeWeb, :controller

  def show(conn, %{"seconds" => seconds}) do
    case Integer.parse(seconds) do
      {s, ""} when seconds > 0 ->
        url = Krabbytime.Repo.get(s)
        redirect conn, external: url
      _ ->
        url = Krabbytime.Repo.get(0)
        redirect conn, external: url
    end
  end
end
