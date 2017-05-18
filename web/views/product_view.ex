defmodule Pocapi.ProductView do
  use Pocapi.Web, :view

  def render("index.json", %{products: products}) do
    %{
      products: Enum.map(products, &product_to_json/1)
    }
  end

  def product_to_json(product) do
    %{
      name: product.name,
      description: product.description,
      rating: product.rating,
      price: product.price
    }
  end
end
