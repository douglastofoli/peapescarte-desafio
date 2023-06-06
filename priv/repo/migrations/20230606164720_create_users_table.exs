defmodule Peapescarte.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nome, :string
      add :nome_social, :string
      add :email, :string
      add :idade, :integer

      timestamps()
    end
  end
end
