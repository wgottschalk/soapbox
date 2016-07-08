defmodule Soapbox.PageController do
  use Soapbox.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
