defmodule Welcome2Cli.Prompter do
  alias Welcome2Cli.State

  def accept_move(game = %State{view: %{moves: moves}}) do
    IO.inspect(moves)

    IO.gets("$ ")
    |> check_input(game)
  end

  defp check_input({:error, reason}, _) do
    IO.puts("Game ended because #{reason}")
    exit(:normal)
  end

  defp check_input(input, game = %State{view: %{moves: moves}}) do
    key = input |> String.trim() |> String.to_atom()

    cond do
      key in moves ->
        IO.puts("Exploring #{key}")
        Map.put(game, :command, key)

      true ->
        movelist = "[" <> (moves |> Enum.join(", ")) <> "]"
        IO.puts("#{key} must be one of: #{movelist}")
        accept_move(game)
    end
  end
end
