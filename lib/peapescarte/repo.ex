defmodule Peapescarte.Repo do
  use Ecto.Repo,
    otp_app: :peapescarte,
    adapter: Ecto.Adapters.Postgres
end
