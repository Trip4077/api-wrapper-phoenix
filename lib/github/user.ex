defmodule Github.User do
  @moduledoc """
  The User context.
  """

  import Ecto.Query, warn: false
  alias Github.Repo

  alias Github.User.Datum

  @doc """
  Returns the list of data.

  ## Examples

      iex> list_data()
      [%Datum{}, ...]

  """
  def list_data(handle)do
    Github.fetch_user_info(handle)
  end

  @doc """
  Gets a single datum.

  Raises `Ecto.NoResultsError` if the Datum does not exist.

  ## Examples

      iex> get_datum!(123)
      %Datum{}

      iex> get_datum!(456)
      ** (Ecto.NoResultsError)

  """
  def get_datum!(id), do: Repo.get!(Datum, id)

  @doc """
  Creates a datum.

  ## Examples

      iex> create_datum(%{field: value})
      {:ok, %Datum{}}

      iex> create_datum(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_datum(attrs \\ %{}) do
    %Datum{}
    |> Datum.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a datum.

  ## Examples

      iex> update_datum(datum, %{field: new_value})
      {:ok, %Datum{}}

      iex> update_datum(datum, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_datum(%Datum{} = datum, attrs) do
    datum
    |> Datum.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Datum.

  ## Examples

      iex> delete_datum(datum)
      {:ok, %Datum{}}

      iex> delete_datum(datum)
      {:error, %Ecto.Changeset{}}

  """
  def delete_datum(%Datum{} = datum) do
    Repo.delete(datum)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking datum changes.

  ## Examples

      iex> change_datum(datum)
      %Ecto.Changeset{source: %Datum{}}

  """
  def change_datum(%Datum{} = datum) do
    Datum.changeset(datum, %{})
  end
end
