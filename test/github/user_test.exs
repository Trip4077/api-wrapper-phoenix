defmodule Github.UserTest do
  use Github.DataCase

  alias Github.User

  describe "data" do
    alias Github.User.Datum

    @valid_attrs %{name: "some name", repo: "some repo", username: "some username"}
    @update_attrs %{name: "some updated name", repo: "some updated repo", username: "some updated username"}
    @invalid_attrs %{name: nil, repo: nil, username: nil}

    def datum_fixture(attrs \\ %{}) do
      {:ok, datum} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.create_datum()

      datum
    end

    test "list_data/0 returns all data" do
      datum = datum_fixture()
      assert User.list_data() == [datum]
    end

    test "get_datum!/1 returns the datum with given id" do
      datum = datum_fixture()
      assert User.get_datum!(datum.id) == datum
    end

    test "create_datum/1 with valid data creates a datum" do
      assert {:ok, %Datum{} = datum} = User.create_datum(@valid_attrs)
      assert datum.name == "some name"
      assert datum.repo == "some repo"
      assert datum.username == "some username"
    end

    test "create_datum/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_datum(@invalid_attrs)
    end

    test "update_datum/2 with valid data updates the datum" do
      datum = datum_fixture()
      assert {:ok, %Datum{} = datum} = User.update_datum(datum, @update_attrs)
      assert datum.name == "some updated name"
      assert datum.repo == "some updated repo"
      assert datum.username == "some updated username"
    end

    test "update_datum/2 with invalid data returns error changeset" do
      datum = datum_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_datum(datum, @invalid_attrs)
      assert datum == User.get_datum!(datum.id)
    end

    test "delete_datum/1 deletes the datum" do
      datum = datum_fixture()
      assert {:ok, %Datum{}} = User.delete_datum(datum)
      assert_raise Ecto.NoResultsError, fn -> User.get_datum!(datum.id) end
    end

    test "change_datum/1 returns a datum changeset" do
      datum = datum_fixture()
      assert %Ecto.Changeset{} = User.change_datum(datum)
    end
  end
end
