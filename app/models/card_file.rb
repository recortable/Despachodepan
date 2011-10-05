# Cardfile
#
#create_table "card_files", :force => true do |t|
#  t.integer "parent_id"
#  t.string  "content_type"
#  t.string  "filename"
#  t.integer "size"
#  t.integer "card_id"
#  t.string  "title"
#  t.string  "stored",       :limit => 300
#end
#
class CardFile < ActiveRecord::Base
  mount_uploader :filename, ImageUploader
  mount_uploader :stored, AmazonUploader
  belongs_to :card

  validates :title, presence: true

  before_save :update_stored_attributes

  def file?
    stored.present? and stored != 'not_exist'
  end

  protected
  def update_stored_attributes
    if stored.present? && stored_changed?
      self.content_type = stored.file.content_type
      self.size = stored.file.size
    end
  end
end

