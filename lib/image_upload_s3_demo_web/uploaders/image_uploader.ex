defmodule ImageUploadS3Demo.ImageUploader do
  use Arc.Definition

  @versions [:original]
  @extension_whitelist ~w(.jpg .jpeg .gif .png .mov)
  @acl :public_read

  def validate({file, _}) do
    file_extension = file.file_name |> Path.extname() |> String.downcase()
    Enum.member?(@extension_whitelist, file_extension)
  end

  def filename(version, {file, scope}) do
    file_name = Path.basename(file.file_name, Path.extname(file.file_name))
    "#{scope.id}_#{version}_#{file_name}"
  end

  def storage_dir(_version, {_file, _user}) do
    "images/"
  end

  def s3_object_headers(_version, {file, _scope}) do
    [
      content_type: MIME.from_path(file.file_name),
      cache_control: "max-age=0,public"
    ]
  end
end
