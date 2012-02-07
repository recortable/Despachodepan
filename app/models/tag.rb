class Tag < ActiveRecord::Base
  default_scope :order => 'position'
  acts_as_list :column => 'position'

  belongs_to :color
  has_and_belongs_to_many :cards

  validates_presence_of :name
  validates_presence_of :color

  def self.reorder
    Tag.all.each_with_index { |tag, index| tag.update_attribute(:position, index + 1) }
  end

end
