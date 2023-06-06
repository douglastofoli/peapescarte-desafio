defmodule Peapescarte.ClientHttp do
  use Tesla

  alias Tesla.Env

  plug Tesla.Middleware.BaseUrl, "https://jsonplaceholder.typicode.com"

  def get do
    "/todos/1"
    |> get()
    |> parse()
  end

  defp parse({:ok, %Env{body: body}}), do: Jason.encode!(body)
end
