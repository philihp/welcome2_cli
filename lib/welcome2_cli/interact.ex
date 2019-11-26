defmodule Welcome2Cli.Interact do
  alias Welcome2Cli.{State, Player}

  def start() do
    Welcome2Game.new_game()
    |> setup_state
    |> Player.play()
  end

  defp setup_state(game) do
    %State{
      service: game
    }
  end
end
