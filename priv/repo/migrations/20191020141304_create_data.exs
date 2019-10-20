defmodule Github.Repo.Migrations.CreateData do
  use Ecto.Migration

  def change do
    create table(:data) do
      add :name, :string
      add :username, :string
      add :repo, :string

      timestamps()
    end

  end
end
