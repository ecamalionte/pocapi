defmodule Pocapi.ProductView do
  use Pocapi.Web, :view

  def render("index.json", %{products: products}) do
    %{
      products: Enum.map(products, &product_to_json/1)
    }
  end
  
  def render("show.json", %{product: product}) do
    %{
      product: product_to_json(product)
    }
  end

  def product_to_json(product) do
    %{
      id: product.id,
      name: product.name,
      description: product.description,
      rating: product.rating,
      price: product.price
    }
  end
end
