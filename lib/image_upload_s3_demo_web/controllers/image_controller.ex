defmodule ImageUploadS3DemoWeb.ImageController do
  use ImageUploadS3DemoWeb, :controller

  alias ImageUploadS3Demo.ImageManager

  def index(conn, _params) do
    images = ImageManager.list_images()
    render(conn, "index.html", images: images)
  end

  def new(conn, _) do
    changeset = ImageManager.change_image()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"image" => %{"path" => image_params}}) do
    case ImageManager.create_image(image_params) do
      {:ok, _image} ->
        conn
        |> put_flash(:info, "圖片上傳成功")
        |> redirect(to: Routes.image_path(conn, :index))

      {:error, changeset} ->
        conn
        |> put_flash(:error, "圖片上傳失敗")
        |> render("new.html", changeset: changeset)
    end
  end
end
