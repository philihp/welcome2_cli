defmodule Welcome2Cli.Prompt do
  alias Welcome2Cli.State

  def accept_move(game = %State{turn: turn}) do
    IO.gets("#{turn}$ ")
    |> check_input(game)
  end

  defp check_input({:error, reason}, _) do
    IO.puts("Game ended because #{reason}")
    exit(:normal)
  end

  defp check_input(input, game = %State{}) do
    input = String.trim(input)

    cond do
      input =~ ~r/\A[a-z]\z/ ->
        Map.put(game, :command, input)

      true ->
        IO.puts("(d)raw")
        IO.puts("(s)huffle")
        accept_move(game)
    end
  end
end
