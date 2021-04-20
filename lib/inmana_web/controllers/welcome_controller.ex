defmodule InmanaWeb.WelcomeController do
  use InmanaWeb, :controller

  def index(conn, params) do
    params
    |> Inmana.Welcomer.welcome()
    |> handle(conn)
  end

  def handle({:ok, msg}, conn) do
    response(conn, msg, :ok)
  end

  def handle({:error, msg}, conn) do
    response(conn, msg, :unauthorized)
  end

  def response(conn, message, status) do
    conn
    |> put_status(status)
    |> json(%{message: message})
  end
end
