ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Soapbox.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Soapbox.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Soapbox.Repo)

