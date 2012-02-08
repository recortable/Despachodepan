# encoding: utf-8

class AmazonUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes
  attr_reader :width, :height

  process :set_content_type
  process :get_version_dimensions

  # Include RMagick or ImageScience support:
  include CarrierWave::RMagick
  # include CarrierWave::ImageScience
#  include CarrierWave::Meta


  # Choose what kind of storage to use for this uploader:
  storage :fog
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  # Create different versions of your uploaded files:
  version :thumb, :if => :image? do
    process :resize_to_fit => [100, 100]
  end

  protected

  def image?(new_file)
    new_file.content_type.include? 'image'
  end

  def get_version_dimensions
    @width, @height = `identify -format "%wx%h" #{file.path}`.split(/x/)
  end
end
