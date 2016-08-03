defmodule Soapbox.Repo.Migrations.CreateMovie do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :title, :string
      add :release_date, :string
      add :overview, :string
      add :img_url, :string

      timestamps
    end

  end
end
