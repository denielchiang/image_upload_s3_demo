defmodule ImageUploadS3Demo.Repo do
  use Ecto.Repo,
    otp_app: :image_upload_s3_demo,
    adapter: Ecto.Adapters.Postgres
end
