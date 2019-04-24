defmodule Collisions.Floyd do
  def run(fun, message) do
    turtle = fun.(message)
    hare =
      fun.(message)
      |> fun.()

    hare = first_loop(fun, turtle, hare, 0)

    {collision1, collision2, hash, _} = second_loop(fun, message, hare, 0)

    %{
      collision1: collision1,
      collision2: collision2,
      hash: hash
    }
  end

  defp first_loop(_fun, hare_value, hare_value, _counter) do
    hare_value
  end
  defp first_loop(fun, turtle, hare, counter) do
    new_turtle = fun.(turtle)
    new_hare = fun.(hare) |> fun.()

    if rem(counter, 1000000) == 0 do
      IO.puts "Round #{counter}"
      IO.inspect new_turtle
      IO.inspect new_hare
    end

    first_loop(fun, new_turtle, new_hare, counter + 1)
  end

  defp second_loop(fun, turtle, hare, first_repetition_index) do
    new_turtle = fun.(turtle)
    new_hare = fun.(hare)

    if (new_turtle == new_hare) do
      {turtle, hare, new_hare, first_repetition_index + 1}
    else
      second_loop(fun, new_turtle, new_hare, first_repetition_index + 1)
    end
  end
end
