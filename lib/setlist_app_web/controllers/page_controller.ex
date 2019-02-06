defmodule SetlistAppWeb.PageController do
  use SetlistAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
