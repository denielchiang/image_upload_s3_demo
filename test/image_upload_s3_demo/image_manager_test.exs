defmodule ImageUploadS3Demo.ImageManagerTest do
  use ImageUploadS3Demo.DataCase

  alias ImageUploadS3Demo.ImageManager

  describe "images" do
    alias ImageUploadS3Demo.ImageManager.Image

    @valid_attrs %{path: "some path"}
    @update_attrs %{path: "some updated path"}
    @invalid_attrs %{path: nil}

    def image_fixture(attrs \\ %{}) do
      {:ok, image} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ImageManager.create_image()

      image
    end

    test "list_images/0 returns all images" do
      image = image_fixture()
      assert ImageManager.list_images() == [image]
    end

    test "get_image!/1 returns the image with given id" do
      image = image_fixture()
      assert ImageManager.get_image!(image.id) == image
    end

    test "create_image/1 with valid data creates a image" do
      assert {:ok, %Image{} = image} = ImageManager.create_image(@valid_attrs)
      assert image.path == "some path"
    end

    test "create_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ImageManager.create_image(@invalid_attrs)
    end

    test "update_image/2 with valid data updates the image" do
      image = image_fixture()
      assert {:ok, %Image{} = image} = ImageManager.update_image(image, @update_attrs)
      assert image.path == "some updated path"
    end

    test "update_image/2 with invalid data returns error changeset" do
      image = image_fixture()
      assert {:error, %Ecto.Changeset{}} = ImageManager.update_image(image, @invalid_attrs)
      assert image == ImageManager.get_image!(image.id)
    end

    test "delete_image/1 deletes the image" do
      image = image_fixture()
      assert {:ok, %Image{}} = ImageManager.delete_image(image)
      assert_raise Ecto.NoResultsError, fn -> ImageManager.get_image!(image.id) end
    end

    test "change_image/1 returns a image changeset" do
      image = image_fixture()
      assert %Ecto.Changeset{} = ImageManager.change_image(image)
    end
  end
end
