defmodule Peapescarte.User do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_fields ~w(nome nome_social email idade)a

  schema "users" do
    field :nome, :string
    field :nome_social, :string
    field :email, :string
    field :idade, :integer
    field :email_confirmado, :boolean

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, attrs) do
    user
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_number(:idade, greater_than: 0)
  end
end

%{
  nome: "Nome inventado",
  nome_social: "Nome social inventado",
  email: "email inventado",
  idade: "numero aleatório entre 1 e 100"
}
