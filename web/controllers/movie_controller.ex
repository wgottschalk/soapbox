defmodule Soapbox.MovieController do
  use Soapbox.Web, :controller
  use HTTPoison.Base

  @now_playing_url "https://api.themoviedb.org/3/movie/now_playing?api_key=43d55fc776bfd28d9b5e10cf50776634"
  def now_playing(conn, _params) do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get @now_playing_url
    {:ok, %{"results" => results}} = Poison.decode body

    conn
    |> put_status(200)
    |> json(%{movies: scrub_movies(results)})
  end

  @coming_soon_url "https://api.themoviedb.org/3/movie/upcoming?api_key=43d55fc776bfd28d9b5e10cf50776634"
  def coming_soon(conn, _params) do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get @coming_soon_url
    {:ok, %{"results" => results}} = Poison.decode body
    conn
    |> put_status(200)
    |> json(%{movies: scrub_movies(results)})
  end

  @base_url "https://image.tmdb.org/t/p/w185"
  defp scrub_movies(movieList) do
    Enum.map movieList, fn(movie) ->
      img_url = if movie["poster_path"] do
        @base_url <> movie["poster_path"]
      else
        ""
      end
      %{
        title: movie["title"],
        summary: movie["overview"],
        img_url: img_url,
        release_date: movie["release_date"]
      }
    end

  end
end
