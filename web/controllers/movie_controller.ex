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
    |> json( %{movies: Enum.reverse scrub_movies(results)} )
  end

  # backdrop_path
  # @base_url "https://image.tmdb.org/t/p/w500_and_h281_bestv2"
  # poster_path
  @base_url "https://image.tmdb.org/t/p/w300_and_h450_bestv2"
  defp scrub_movies(movie_list) do
    movie_list
    |> Enum.sort(fn (movie_a, movie_b) ->
      date_a = Date.from_iso8601!(movie_a["release_date"])
      date_b = Date.from_iso8601!(movie_b["release_date"])
      Timex.compare(date_a, date_b, :days) > 0
    end)
    |> Enum.map( fn(movie) ->
      img_url = if movie["poster_path"] do
        @base_url <> movie["poster_path"]
      else
        ""
      end

      %{
        title: movie["title"],
        summary: movie["overview"],
        img_url: img_url,
        release_date: format_date movie["release_date"]
      }
    end)

  end

  defp format_date(date_string) do
    Date.from_iso8601!(date_string)
    |> Timex.format!("{WDshort} {Mshort} {D}, {YYYY}")
    |> String.upcase()
  end
end
