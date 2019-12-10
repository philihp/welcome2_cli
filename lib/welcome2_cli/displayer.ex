defmodule Welcome2Cli.Displayer do
  alias Welcome2Cli.State

  def display(
        state = %State{
          view: %{
            player: player,
            shown0: shown0,
            shown1: shown1,
            shown2: shown2,
            deck0_suit: deck0_suit,
            deck1_suit: deck1_suit,
            deck2_suit: deck2_suit
          }
        }
      ) do
    IO.puts("================================================================================")
    IO.puts("Permit 0: #{permit(shown0, deck0_suit)}")
    IO.puts("Permit 1: #{permit(shown1, deck1_suit)}")
    IO.puts("Permit 2: #{permit(shown2, deck2_suit)}")
    IO.puts("")
    IO.puts(row(player, :a))
    IO.puts(row(player, :b))
    IO.puts(row(player, :c))
    IO.puts("Plans:  Parks:    Pools: " <> pools(player) <> "  Estate:  1  2  3  4  5  6")

    IO.puts(
      "1: " <>
        plan(player, 1) <>
        "   a: " <>
        park(player, :a) <>
        "     Temps: " <>
        temps(player) <>
        "     for: " <>
        estate(player, 1) <>
        " " <>
        estate(player, 2) <>
        " " <>
        estate(player, 3) <>
        " " <> estate(player, 4) <> " " <> estate(player, 5) <> " " <> estate(player, 6)
    )

    IO.puts(
      "2: " <>
        plan(player, 2) <> "   b: " <> park(player, :b) <> "       Bis: " <> bis(player) <> ""
    )

    IO.puts(
      "3: " <>
        plan(player, 3) <>
        "   c: " <> park(player, :c) <> "  Refusals: " <> refusals(player) <> ""
    )

    state
  end

  defp permit(%{face: face, suit: suit}, next) do
    :io_lib.format("~2b ~-20s next-> ~-20s", [face, suit, next])
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
      _ -> pad(number, 2) <> suffix
    end
  end

  defp pools(player) do
    pad(player.pools, 2)
  end

  defp plan(player, num) do
    pad(Map.get(player, :"plan#{num}"), 2)
  end

  defp temps(player) do
    pad(player.temps, 2)
  end

  defp bis(player) do
    pad(player.bis, 2)
  end

  defp refusals(player) do
    pad(player.refusals, 2)
  end

  defp park(player, row) do
    pad(Map.get(player, :"park#{row}"), 2)
  end

  defp estate(player, size) do
    pad(Map.get(player, :"estate#{size}"), 2)
  end

  defp pad(n, pad) do
    n
    |> Integer.to_string()
    |> String.pad_leading(pad)
  end
end
