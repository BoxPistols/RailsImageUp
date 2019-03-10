class ImageUploader < CarrierWave::Uploader::Base
  storage :ftp
  CarrierWave.configure do |config|
    config.ftp_host = 'theno.sakura.ne.jp'
    config.ftp_port = 21
    config.ftp_user = 'theno'
    config.ftp_passwd = 'b66wxz787z'
    config.ftp_folder = '/home/theno/www/sns/photo'
    config.ftp_url = 'http://theno.jp/sns/photo'
    config.ftp_passive = false # false by default
    config.ftp_tls = false # false by default
  end

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # resize_to_fitはファイルのサイズを変更します
  # アップロードされたファイルを200〜200以下に変換する
  process resize_to_fit: [200, 200]

  # 別のスケールを設定
  version :thumb do
    process resize_to_fit: [50, 50]
  end

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
