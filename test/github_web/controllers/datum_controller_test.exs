defmodule GithubWeb.DatumControllerTest do
  use GithubWeb.ConnCase

  alias Github.User
  alias Github.User.Datum

  @create_attrs %{
    name: "some name",
    repo: "some repo",
    username: "some username"
  }
  @update_attrs %{
    name: "some updated name",
    repo: "some updated repo",
    username: "some updated username"
  }
  @invalid_attrs %{name: nil, repo: nil, username: nil}

  def fixture(:datum) do
    {:ok, datum} = User.create_datum(@create_attrs)
    datum
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all data", %{conn: conn} do
      conn = get(conn, Routes.datum_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create datum" do
    test "renders datum when data is valid", %{conn: conn} do
      conn = post(conn, Routes.datum_path(conn, :create), datum: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.datum_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "repo" => "some repo",
               "username" => "some username"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.datum_path(conn, :create), datum: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update datum" do
    setup [:create_datum]

    test "renders datum when data is valid", %{conn: conn, datum: %Datum{id: id} = datum} do
      conn = put(conn, Routes.datum_path(conn, :update, datum), datum: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.datum_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "repo" => "some updated repo",
               "username" => "some updated username"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, datum: datum} do
      conn = put(conn, Routes.datum_path(conn, :update, datum), datum: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete datum" do
    setup [:create_datum]

    test "deletes chosen datum", %{conn: conn, datum: datum} do
      conn = delete(conn, Routes.datum_path(conn, :delete, datum))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.datum_path(conn, :show, datum))
      end
    end
  end

  defp create_datum(_) do
    datum = fixture(:datum)
    {:ok, datum: datum}
  end
end
