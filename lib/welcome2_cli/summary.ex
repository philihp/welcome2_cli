defmodule Welcome2Cli.Summary do
  alias Welcome2Cli.State

  def display(state = %State{view: view}) do
    view |> IO.inspect()
    state
  end
end
