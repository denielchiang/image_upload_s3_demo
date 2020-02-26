defmodule ImageUploadS3Demo.ImageManager.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :path, :string

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:path])
    |> validate_required([:path])
  end
end
