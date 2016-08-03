defmodule Soapbox.Movie do
  use Soapbox.Web, :model

  schema "movies" do
    field :title, :string
    field :release_date, :string
    field :overview, :string
    field :img_url, :string

    timestamps
  end

  @required_fields ~w(title release_date overview img_url)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
