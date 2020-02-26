# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :image_upload_s3_demo,
  ecto_repos: [ImageUploadS3Demo.Repo]

# Configures the endpoint
config :image_upload_s3_demo, ImageUploadS3DemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oJToDFdQ/VR+z+C4raEkUI19rPTaka6IhAtPw7Vpb6SvwLCGZ2Y9D0yHDbQ1188n",
  render_errors: [view: ImageUploadS3DemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ImageUploadS3Demo.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
