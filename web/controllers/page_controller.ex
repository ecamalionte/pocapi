defmodule Pocapi.PageController do
  use Pocapi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
