defmodule Welcome2Cli.Mover do
  alias Welcome2Cli.State

  def make_move(state = %State{command: "d"}) do
    %State{state | service: Welcome2Game.draw(state.service)}
  end

  def make_move(state = %State{command: "s"}) do
    %State{state | service: Welcome2Game.shuffle(state.service)}
  end

  def make_move(state) do
    state
  end
end
