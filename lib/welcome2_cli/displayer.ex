defmodule Welcome2Cli.Displayer do
  alias Welcome2Cli.State

  def display(state = %State{view: view}) do
    IO.inspect(view)
    state
  end
end
