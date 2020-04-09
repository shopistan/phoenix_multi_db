defmodule PhoenixMultiDb.PageController do
  use PhoenixMultiDb.Web, :controller

  alias PhoenixMultiDb.Setting
  alias PhoenixMultiDb.Second
  alias PhoenixMultiDb.Customer

  def index(conn, _params) do
    render conn, "index.html"
  end

  def fetch(conn, %{"id" => id}) do
    try do
      setting = Repo.get_by(Setting, user: id)
      customer = Second.get_by(Customer, user: id)
      json(conn, %{user: setting.id, name: setting.name,cnic: customer.cinc})
    rescue e in UndefinedFunctionError -> e
      json(conn, %{error: "NO USER FOUND"})
    end
  end

end
