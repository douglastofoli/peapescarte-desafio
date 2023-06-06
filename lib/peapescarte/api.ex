defmodule Peapescarte.Api do
  use GenServer
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://jsonplaceholder.typicode.com"
  @rate_limit 10

  @impl true
  def init(state) do
    {:ok, state, @rate_limit}
  end

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def get_data() do
    GenServer.call(__MODULE__, :get_data)
  end

  @impl true
  def handle_info(_, state) do
    {:noreply, state}
  end

  @impl true
  def handle_call(:get_data, _from, state) do
    {:ok, %Tesla.Env{body: body}} = get("/todos/1")
    {:reply, body, state}
  end
end
