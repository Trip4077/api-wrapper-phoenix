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
    |> IO.inspect
    render(conn, "show.json", datum: datum)
  end

  def update(conn, %{"id" => id, "datum" => datum_params}) do
    datum = User.get_datum!(id)

    with {:ok, %Datum{} = datum} <- User.update_datum(datum, datum_params) do
      render(conn, "show.json", datum: datum)
    end
  end

  def delete(conn, %{"id" => id}) do
    datum = User.get_datum!(id)

    with {:ok, %Datum{}} <- User.delete_datum(datum) do
      send_resp(conn, :no_content, "")
    end
  end
end
