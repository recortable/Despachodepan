# Pan
# The base class for card elements
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
  mount_uploader :image, AmazonUploader

  validates :card_id, presence: true

  before_save :reverse_date

  # http://zilkey.com/2008/3/24/advanced-acts_as_list-scope-with-multiple-columns
  # #{connection.quote_column_name("rol")}
  def scope_condition
    "card_id = #{card_id} AND type = #{quote_value(type)}"
  end

  private
  def reverse_date
    self.rev_date = self.date.split('/').reverse.join('/')
  end


end
