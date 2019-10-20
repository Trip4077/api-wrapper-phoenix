defmodule GithubWeb.DatumController do
  use GithubWeb, :controller

  alias Github.User
  alias Github.User.Datum

  action_fallback GithubWeb.FallbackController

  def index(conn, _params) do
    data = User.list_data("trip4077")
    render(conn, "index.json", data: data)
  end

  def show(conn, %{"id" => id}) do
    datum = User.list_data(id)

    render(conn, "details.html", datum: datum)
  end
end
