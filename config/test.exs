use Mix.Config

# Configure your database
config :image_upload_s3_demo, ImageUploadS3Demo.Repo,
  username: "postgres",
  password: "postgres",
  database: "image_upload_s3_demo_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :image_upload_s3_demo, ImageUploadS3DemoWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
