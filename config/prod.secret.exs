use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :soapbox, Soapbox.Endpoint,
  secret_key_base: "CxRJUAdMNBjHdAI8pCTnxQBqWwLLdLwTSAHJlSGhF7MxkiDmdNrrrB0Ewg6v7YhF"

# Configure your database
config :soapbox, Soapbox.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "soapbox_prod",
  pool_size: 20
