defmodule ImageUploadS3Demo.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :path, :string

      timestamps()
    end

  end
end
