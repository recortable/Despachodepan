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
# @deprecated
class Image < ActiveRecord::Base
  mount_uploader :filename, ImageUploader
  #mount_uploader :stored, AmazonUploader
  #has_attachment :content_type => :image,
  #               :storage => :file_system,
  #               :path_prefix => 'public/media/images',
  #               :thumbnails => { :thumb => '100x100>' }

  #  validates_as_attachment

  has_many :slides
  has_many :cards, :through => :slides

  def file?
    stored.present? and stored != 'not_exist'
  end

  before_save :update_stored_attributes

  protected
  def update_stored_attributes
    if stored.present? && stored_changed?
      self.content_type = stored.file.content_type
      self.size = stored.file.size
    end
  end

end
