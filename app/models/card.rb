# encoding: utf-8
require 'date.rb'

class Card < ActiveRecord::Base

  NAMED = {lapanaderia: 1, casamasomenos: 72}

  extend FriendlyId
  friendly_id :title, use: :slugged

  default_scope :order => 'updated_at DESC'

  has_many :slide_images, order: 'position ASC', dependent: :destroy
  has_many :selections, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :pan_files, :class_name => 'PanFile', :dependent => :destroy

  has_one :main_image, dependent: :destroy
  has_one :main_slide, class_name: 'SlideImage'

  belongs_to :color
  has_and_belongs_to_many :tags, :include => [:color]

  # VALIDATIONS
  validates_presence_of :title

  POSITION = {:top => 0, :bottom => 1}

  BEGIN_YEAR = 2001
  BLOCS_PER_YEAR = 16
  DAYS_PER_BLOC = 365 / 16

  def displayable?
    visible? and start.present? and vposition.present?
  end

  def is_about?(tag)
    !tags.to_a.find { |t| t.id == tag.id }.nil?
  end

  def begin_column
    date_to_column(parse_date start)
  end

  def end_column
    if finish.nil? || finish.empty?
      date_to_column(Date.today)
    else
      date_to_column(parse_date(finish))
    end
  end

  def column_of(str_date)
    date_to_column(parse_date(str_date))
  end

  def color?
    !color.nil?
  end

  def has_color
    !color.nil?
  end

  def selection_width
    self.selection_image ? self.selection_image.width : 200
  end

  # FIXME: no muy ruby, la verdad
  def selected_tags=(data)
    self.tags.clear
    data.split('tag').each { |id| self.tags << Tag.find(id) if id.length > 0 }
  end

  private
  def parse_date(str_date)
    a = str_date.split('/').map { |str| str.to_i }
    Date.new(a[2], a[1], a[0])
  end

  def date_to_column(date)
    year = date.year - BEGIN_YEAR
    offset = date.yday / DAYS_PER_BLOC
    year * BLOCS_PER_YEAR + offset
  end
end
