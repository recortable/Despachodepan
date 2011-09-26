# Image: an image file
#
# SCHEMA
#  create_table "images", :force => true do |t|
#    t.integer "parent_id"
#    t.string  "content_type"
#    t.string  "filename"
#    t.string  "thumbnail"
#    t.integer "size"
#    t.integer "width"
#    t.integer "height"
#  end
#
class Image < ActiveRecord::Base
  mount_uploader :filename, ImageUploader
  #has_attachment :content_type => :image,
  #               :storage => :file_system,
  #               :path_prefix => 'public/media/images',
  #               :thumbnails => { :thumb => '100x100>' }

  #  validates_as_attachment

  has_many :slides
  has_many :cards, :through => :slides


end
