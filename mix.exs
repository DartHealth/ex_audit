defmodule ExAudit.Mixfile do
  use Mix.Project

  def project do
    [
      description: "Ecto auditing library that transparently tracks changes and can revert them",
      aliases: aliases(),
      app: :ex_audit,
      version: "0.9.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: paths(Mix.env()),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        check: :test,
        coveralls: :test
      ],
      source_url: "https://github.com/zenneriot/ex_audit",
      package: [
        licenses: ["MIT"],
        maintainers: ["Moritz Schmale <ms@zenner-iot.com>"],
        links: %{
          "GitHub" => "https://github.com/zenneriot/ex_audit",
          "Documentation" => "https://hexdocs.pm/ex_audit"
        }
      ],
      docs: [
        main: "ExAudit",
        extras: ["README.md"]
      ]
    ]
  end

  def paths(:test) do
    paths(:default) ++ ["./example"]
  end

  def paths(:default) do
    ["./lib"]
  end

  def paths(_), do: paths(:default)

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {ExAudit, []},
      extra_applications: [:logger]
    ]
  end

  defp aliases do
    [
      check: [
        "clean",
        "deps.unlock --check-unused",
        "compile --all-warnings --warnings-as-errors",
        "deps.unlock --check-unused",
        "test --warnings-as-errors",
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false},
      {:ecto, ">= 3.0.0"},
      {:ecto_sql, ">= 3.0.0"},
      {:postgrex, "~> 0.15", only: :test},
      {:excoveralls, "~> 0.7", only: :test},
      {:ex_doc, ">= 0.0.0", runtime: false, only: :dev},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false}
    ]
  end
end
