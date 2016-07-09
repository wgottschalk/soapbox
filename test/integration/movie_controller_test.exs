defmodule Soapbox.MovieIntegrationTest do
  use ExUnit.Case, async: true
  use Soapbox.ConnCase

  test "GET /api/now_playing", %{conn: conn} do
    conn = get conn, "/api/now_playing"
    %{"movies" => movieList}= json_response(conn, 200)
    assert Enum.count(movieList) > 0
  end

  test "GET /api/coming_soon", %{conn: conn} do
    conn = get conn, "/api/now_playing"
    %{"movies" => movieList}= json_response(conn, 200)
    assert response.status == 200
  end

end
