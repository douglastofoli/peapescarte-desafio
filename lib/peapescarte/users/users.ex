defmodule Peapescarte.Users.Users do
  alias Peapescarte.{Repo, User}

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
