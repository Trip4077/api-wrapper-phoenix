defmodule GithubWeb.DatumController do
  use GithubWeb, :controller

  alias Github.User
  alias Github.User.Datum

  action_fallback GithubWeb.FallbackController

  def index(conn, _params) do
    # Grab a list of user data from my github
    data = User.list_data("trip4077")
    render(conn, "index.json", data: data)
  end

  def show(conn, %{"id" => id}) do
    # Grab a list of user data from an id (github username) passed from the route
    datum = User.list_data(id)
    
    render(conn, "details.html", datum: datum)
  end
end
