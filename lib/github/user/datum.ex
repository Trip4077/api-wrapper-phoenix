defmodule Github.User.Datum do
  use Ecto.Schema
  import Ecto.Changeset

  schema "data" do
    field :name, :string
    field :repo, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(datum, attrs) do
    datum
    |> cast(attrs, [:name, :username, :repo])
    |> validate_required([:name, :username, :repo])
  end
end
