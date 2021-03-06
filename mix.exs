defmodule Krabbytime.Mixfile do
  use Mix.Project

  def project do
    [
      app: :krabbytime,
      version: "0.0.2",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Krabbytime.Application, []},
      applications: [:timber, :phoenix, :cowboy, :parse_trans, :plug],
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.4"},
      {:cowboy, "~> 1.0"},
      {:timber, "~> 2.5"},
      {:distillery, "~> 2.0.0-rc.12", runtime: false},
    ]
  end
end
