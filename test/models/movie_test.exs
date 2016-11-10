defmodule Soapbox.MovieTest do
  use Soapbox.ModelCase

  alias Soapbox.Movie

  @valid_attrs %{img_url: "some content", overview: "some content", release_date: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Movie.changeset(%Movie{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Movie.changeset(%Movie{}, @invalid_attrs)
    refute changeset.valid?
  end
end
