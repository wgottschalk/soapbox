defmodule Soapbox.MovieIntegrationTest do
  use ExUnit.Case, async: true
  use Soapbox.ConnCase

  test "GET /api/now_playing", %{conn: conn} do
    conn = get conn, "/api/now_playing"
    %{"movies" => movies} = json_response(conn, 200)
    assert Enum.count(movies) > 6
  end

  test "GET /api/coming_soon", %{conn: conn} do
    conn = get conn, "/api/coming_soon"
    %{"movies" => movies} = json_response(conn, 200)
    IO.inspect movies
    assert Enum.count(movies) > 6
  end

end
