# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Peapescarte.Repo.insert!(%Peapescarte.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Peapescarte.Users.Users

names = ["Alice", "Bob", "Charlie", "David", "Eva", "Frank", "Grace", "Hannah", "Isaac", "Julia"]

social_names = [
  "Alex",
  "Bailey",
  "Cameron",
  "Dakota",
  "Elliott",
  "Finley",
  "Harper",
  "Jordan",
  "Kai",
  "Lennon"
]

domains = ["example.com", "test.com", "dummy.net", "foobar.org"]

users =
  Enum.map(1..50, fn _ ->
    name = Enum.random(names)
    social_name = Enum.random(social_names)
    email = "#{String.downcase(name)}@#{Enum.random(domains)}"
    age = Enum.random(1..100)

    %{
      nome: name,
      nome_social: social_name,
      email: email,
      idade: age
    }
  end)

Enum.map(users, fn user ->
  Users.create_user(user)
end)
