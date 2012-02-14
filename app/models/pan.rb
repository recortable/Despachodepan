# Pan
# The base class for card components
# This includes: SlideImage, Post, Selection, MainImage, PanFile
#
#t.string   "type",         :limit => 32
#t.integer  "card_id"
#t.string   "text",         :limit => 300
#t.integer  "position"
#t.string   "date",         :limit => 100
#t.text     "body"
#t.string   "extra",        :limit => 32
#t.string   "rev_date",     :limit => 16
#t.string   "content_type", :limit => 64
#t.integer  "size"
#t.integer  "width"
#t.integer  "height"
#t.string   "image",        :limit => 300
#t.datetime "created_at"
#t.datetime "updated_at"
#
class Pan < ActiveRecord::Base
  belongs_to :card


  mount_uploader :file, AmazonUploader

  validates :card_id, presence: true

  before_save :reverse_date, :update_file_attributes

  # http://zilkey.com/2008/3/24/advanced-acts_as_list-scope-with-multiple-columns
  # #{connection.quote_column_name("rol")}
  def scope_condition
    "card_id = #{card_id} AND type = #{quote_value(type)}"
  end

  def show_col?(item)
    true
  end

  def extra_label_human_name
    'extra'
  end

  def extra_values
    []
  end

  def extra_human_name
    extra
  end

  private
  def reverse_date
    self.rev_date = self.date.split('/').reverse.join('/') if self.date.present?
  end

  def update_file_attributes
    if file.present? and file_changed?
      self.width = file.width
      self.height = file.height
    end
  end
end
