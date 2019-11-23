defmodule Welcome2Cli.Summary do
  alias Welcome2Cli.State

  def display(state = %State{service: game}) do
    game |> IO.inspect()
    state
  end
end
