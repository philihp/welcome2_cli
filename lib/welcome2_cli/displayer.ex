defmodule Welcome2Cli.Displayer do
  alias Welcome2Cli.State

  def display(state = %State{view: %{player: player}}) do
    IO.puts(row(player, :a))
    IO.puts(row(player, :b))
    IO.puts(row(player, :c))
    state
  end

  defp row(player, row) do
    "|" <>
      for(index <- 1..%{a: 9, b: 10, c: 11}[row], into: "") do
        "#{n(player, row, index)}#{f(player, row, index)}"
      end <>
      n(player, row, 10) <>
      "|"
  end

  defp f(player, row, number) do
    case Map.get(player, :"fence#{row}#{number}") do
      true -> "|"
      false -> " "
    end
  end

  defp n(player, row, index) do
    number = Map.get(player, :"row#{row}#{index}number")

    suffix =
      cond do
        Map.get(player, :"row#{row}#{index}pool") -> "p"
        Map.get(player, :"row#{row}#{index}bis") -> "b"
        true -> " "
      end

    case number do
      0 -> "___"
      _ -> :io_lib.format("~2b~1s", [number, suffix])
    end
  end
end
