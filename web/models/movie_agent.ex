defmodule Soapbox.MovieAgent do
    def new do
      Agent.start_link(fn -> %{movies: [], expirationDate: DateTime.utc_now()} end, name: __MODULE__)
    end

    def checkCache(pid) do
      Agent.get(pid, fn (state) -> state.expirationDate end)
    end

    def setMovies(pid, movies) do
      Agent.update(pid, fn -> %{
        expirationDate: DateTime.utc_now(),
        movies: movies
      } end )
    end
end
