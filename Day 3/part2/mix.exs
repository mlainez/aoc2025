defmodule Battery.MixProject do
  use Mix.Project

  def project do
    [
      app: :part2,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [espec: :test],
      aliases: [test: ["espec"]]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:espec, "~> 1.8", only: :test}
    ]
  end
end
