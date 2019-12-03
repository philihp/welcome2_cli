defmodule Welcome2Cli.MixProject do
  use Mix.Project

  def project do
    [
      app: :welcome2_cli,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      included_applications: [:welcome2_game],
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      welcome2_game: [path: "../welcome2_game"]
    ]
  end
end
