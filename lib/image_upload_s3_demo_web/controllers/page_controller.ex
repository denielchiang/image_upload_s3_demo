defmodule ImageUploadS3DemoWeb.PageController do
  use ImageUploadS3DemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
