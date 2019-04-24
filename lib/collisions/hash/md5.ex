defmodule Collisions.Hash.Md5 do
  use GenServer

  @name __MODULE__

  def start_link([]) do
    GenServer.start_link(@name, %{prefix: ""}, name: @name)
  end

  def set_prefix(prefix) do
    GenServer.cast(@name, {:prefix, prefix})
  end

  def run(message) do
    GenServer.call(@name, {:run, message})
  end

  def init(state) do
    {:ok, state}
  end

  def handle_cast({:prefix, prefix}, state) do
    {:noreply, %{state | prefix: prefix}}
  end

  def handle_call({:run, message}, _, state) do
    prefix = state.prefix

    hash = run(message, prefix)
    {:reply, hash, state}
  end

  defp run(message, prefix) do
    hash = :crypto.hash(:md5, message)
    double_hash = :crypto.hash(:md5, hash)

    <<head :: binary-size(7)>> <> _ = double_hash

    prefix <> (head |> Base.encode16())
  end
end
