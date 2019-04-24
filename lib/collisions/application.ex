defmodule Collisions.Application do
  use Application

  def start(_type, _args) do
    children = [
      Collisions.Hash.Md5
    ]

    opts = [strategy: :one_for_one, name: Collisions.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
