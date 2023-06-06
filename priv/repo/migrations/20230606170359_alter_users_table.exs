defmodule Peapescarte.Repo.Migrations.AlterUsersTable do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :email_confirmado, :boolean
    end
  end
end
