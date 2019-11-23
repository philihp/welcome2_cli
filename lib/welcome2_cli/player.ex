defmodule Welcome2Cli.Player do
  alias Welcome2Cli.{State, Summary, Prompt, Mover}

  def continue(game) do
    game
    |> Summary.display()
    |> Prompt.accept_move()
    |> Mover.make_move()
    |> play
  end

  def play(%State{service: %{deck0: []}}) do
    IO.puts("Decks are empty")
    exit(:normal)
  end

  def play(game = %State{}) do
    IO.puts("Dealt new cards")
    continue(game)
  end

  def play(game) do
    continue(game)
  end

  def display(game) do
    game
  end

  def prompt(game) do
    game |> IO.inspect()
  end

  def make_move(game) do
    game
  end
end
