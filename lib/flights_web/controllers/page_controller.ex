defmodule FlightsWeb.PageController do
  use FlightsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
