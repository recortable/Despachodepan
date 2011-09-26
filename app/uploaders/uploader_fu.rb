# Helps you migrate from attachment_fu
# put it in your /lib dir and include it your xxxx_uploader.rb
module UploaderFu

  def partition_dir
    ("%08d" % model.id).scan(/\d{4}/).join("/")
  end

  def model_dir
    "#{model.class.to_s.underscore}s/"
  end

  def root_dir
    version_name ? "public/media" : "public/media"
  end

  # store dir is composed of root_dir, model_dir, partition_dir
  # override/change any of those to fit your needs
  def store_dir
    File.join Rails.root, root_dir, model_dir, partition_dir
  end

  ### For AttachmentFu Legacy :
  # version :thumb do
  #   process :resize_to_fill => [80, 80]
  #
  #   def full_filename(for_file)
  #     full_filename_fu( super )
  #   end
  #
  # end
  def full_filename_fu(filename)
    version_prefix = "#{version_name}_"
    filename = filename.gsub(version_prefix, "")
    ext = nil
    basename = filename.gsub /\.\w+$/ do |s|
      ext = s; ''
    end
    "#{basename}_#{version_name}#{ext}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
    File.join "/images", model_dir, default_url_filename
  end

  def default_url_filename
    [version_name, "default.jpg"].compact.join('_')
  end
end