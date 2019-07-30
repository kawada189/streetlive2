class ImageUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick

  process resize_to_fit: [200, 200]

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end


  def store_dir
    "uploads/#{Post.class.to_s.underscore}/#{:image}
  end

  def extension_whitelist
    %w(png jpg)
  end

  def filename
    original_filename if original_filename
  end
end
