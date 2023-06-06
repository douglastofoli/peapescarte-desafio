defmodule Peapescarte.Api do
  use GenServer

  alias Peapescarte.ClientHttp

  @rate_limit 10

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def get_data do
    GenServer.call(__MODULE__, :get_data)
  end

  @impl true
  def init(state) do
    {:ok, state, @rate_limit}
  end

  @impl true
  def handle_call(:get_data, _from, state) do
    response = ClientHttp.get()

    {:reply, response, state}
  end

  @impl true
  def handle_info(_, state) do
    {:noreply, state}
  end
end
