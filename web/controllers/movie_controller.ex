defmodule Soapbox.MovieController do
  use Soapbox.Web, :controller

  def now_playing(conn, _params) do
    conn
    |> put_status(200)
    |> json(%{movies: ["now_playing"]})
  end

  def coming_soon(conn, _params) do
    conn
    |> put_status(200)
    |> json(%{movies: ["coming_soon"]})
  end
end
