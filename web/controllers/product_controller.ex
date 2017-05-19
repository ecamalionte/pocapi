defmodule Pocapi.ProductController do
  use Pocapi.Web, :controller

  require IEx

  alias Pocapi.Product

  def index(conn, _params) do
    products = Repo.all(Product)
    render(conn, :index, products: products)
  end

  def new(conn, _params) do
    changeset = Product.changeset(%Product{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"product" => product_params}) do
    changeset = Product.changeset(%Product{}, product_params)

    case Repo.insert(changeset) do
      {:ok, _product} ->
        conn
        |> put_flash(:info, "Product created successfully.")
        |> redirect(to: product_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    product = find_product(conn, id)
    render(conn, :show, product: product)
  end

  def edit(conn, %{"id" => id}) do
    product = find_product(conn, id)
    changeset = Product.changeset(product)
    render(conn, "edit.html", product: product, changeset: changeset)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = find_product(conn, id)
    changeset = Product.changeset(product, product_params)

    case Repo.update(changeset) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product updated successfully.")
        |> redirect(to: product_path(conn, :show, product))
      {:error, changeset} ->
        render(conn, "edit.html", product: product, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = find_product(conn,id)
    Repo.delete!(product)
    conn
    |> put_flash(:info, "Product deleted successfully.")
    |> redirect(to: product_path(conn, :index))
  end


  defp find_product(conn, id) do
    product = Repo.get(Product, id)
    unless product do
      conn
      |> put_flash(:error, "Product not found!")
      |> redirect(to: product_path(conn, :index))
    end

    product
  end
end
