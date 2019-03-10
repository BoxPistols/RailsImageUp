class UserShotUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::MiniMagick

  # include Cloudinary::CarrierWave

  process convert: 'png' # 画像の保存形式
  process tags: ['image'] # 保存時に添付されるタグ（管理しやすいように適宜変更しましょう）

  # Choose what kind of storage to us e for this uploader:
  # if Rails.env.production?
  #   storage :fog
  # else
  #   storage :file
  # end
  # storage :file if Rails.env.production?
  #
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  version :full do
    process resize_to_fit: [800, 600]
  end

  version :thumb do
    process resize_to_fit: [400, 300]
  end
  #
  def public_id
    'local_test_cloudinary/' + Cloudinary::Utils.random_public_id
  end

  if Rails.env.production?
    include Cloudinary::CarrierWave
  # 本番用設定を書く
  else
    include CarrierWave::RMagick
  # 開発・テスト用設定を書く
end
  # def extension_whitelist
  #   %w[jpg jpeg gif png]
  # end

  # def default_url
  #   '/assets/fallback/' + [version_name, 'default.png'].compact.join('_')
  # end

  # storage :ftp
  # CarrierWave.configure do |config|
  #   config.ftp_host = 'theno.sakura.ne.jp'
  #   config.ftp_port = 21
  #   config.ftp_user = 'theno'
  #   config.ftp_passwd = 'b66wxz787z'
  #   config.ftp_folder = '/home/theno/www/sns/photo'
  #   config.ftp_url = 'http://theno.jp/sns/photo'
  #   config.ftp_passive = false # false by default
  #   config.ftp_tls = false # false by default
  # end
end
