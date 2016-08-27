class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :phase_std do
    resize_to_fit 500, 650
  end

  version :phase_small do
    resize_to_fit 100, 250
  end

end
