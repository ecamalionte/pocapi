defmodule Pocapi.Product do
  use Pocapi.Web, :model

  schema "products" do
    field :name, :string
    field :description, :string
    field :rating, :integer
    field :price, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :rating, :price])
    |> validate_required([:name, :description, :rating, :price])
  end
end
