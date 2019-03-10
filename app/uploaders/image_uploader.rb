class ImageUploader < CarrierWave::Uploader::Base
  process convert: 'png' # 画像の保存形式
  process tags: ['image'] # 保存時に添付されるタグ（管理しやすいように適宜変更しましょう）

  version :full do
    process resize_to_fit: [800, 600]
  end

  version :thumb do
    process resize_to_fit: [400, 300]
  end
  def public_id
    'local_test_cloudinary/' + Cloudinary::Utils.random_public_id
  end

  if Rails.env.production?
    include Cloudinary::CarrierWave
  # 本番用設定を書く
  else
    include CarrierWave::RMagick
    # 開発・テスト用設定
  end
end
