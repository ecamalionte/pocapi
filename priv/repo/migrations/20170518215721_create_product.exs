defmodule Pocapi.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :string
      add :rating, :integer
      add :price, :float

      timestamps()
    end

  end
end
