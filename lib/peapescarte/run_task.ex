defmodule Peapescarte.RunTask do
  use Task

  def start_link(arg) do
    Task.start_link(__MODULE__, :run, [arg])
  end

  def run(numbers) do
    Task.async(fn ->
      sum = Enum.sum(numbers)
      {:ok, sum}
    end)
    |> Task.await()
  end
end
