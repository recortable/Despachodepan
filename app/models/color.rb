# SCHEMA
# create_table "colors", :force => true do |t|
#  t.string "name"
#  t.string "value"
#  t.string "high_value"
# end
class Color < ActiveRecord::Base
  validates :name, presence: true


  def used?
    Card.count(:conditions => {:color_id => self.id}) > 0 || Tag.count(:conditions => {:color_id => self.id}) > 0
  end
end
