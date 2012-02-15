# encoding: utf-8
require 'date.rb'

class Card < ActiveRecord::Base
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

  has_many :old_slides, :order => 'pos', :include => [:image]
  has_many :old_photos,  :order => 'pos', :include => [:image],
           :class_name => 'Slide', :conditions => {:rol => 'slide'}
  has_many :old_news, :order => 'date', :include => [:image],
           :class_name => 'Slide', :conditions => {:rol => 'news'}

  belongs_to :old_selection_image, :class_name => "Image",
             :foreign_key => :selection_image_id, :dependent => :destroy

  # has_many :old_files, :class_name => 'CardFile', :dependent => :destroy
  # has_many :old_card_files, :class_name => 'CardFile', :dependent => :destroy
  #has_many :old_selections, :dependent => :destroy, :order => 'date', :include => [:image],
  #         :class_name => 'Slide', :conditions => {:rol => 'selection'}
  belongs_to :old_main_image, :class_name => "Image",
             :foreign_key => :main_image_id, :dependent => :destroy
  # belongs_to :old_main_slide, :foreign_key => :main_slide_id,
  #           :class_name => 'Slide', :include => [:image]
  # has_one :old_main_slide, :class_name => 'Slide', :conditions => {:rol => 'slide', :extra => 'main'}, :include => [:image]
  belongs_to :old_main_file, :foreign_key => :main_file_id,
             :class_name => 'CardFile'
  #has_one :selection

  # VALIDATIONS
  validates_presence_of :title

  # CALLBACKS
  before_save :generate_url

  POSITION = {:top => 0, :bottom => 1}

  BEGIN_YEAR = 2001
  BLOCS_PER_YEAR = 16
  DAYS_PER_BLOC = 365 / 16


  def displayable?
    visible? and start.present? and vposition.present?
  end

  def reorder_photos
    photos.each_with_index { |photo, index| photo.update_attribute(:pos, index + 1) }
  end

  def path
    "/#{url}"
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

  def generate_url
    if self.respond_to?(:url) && self.url.blank?
      self.url = title.downcase.gsub(' ', '-').gsub(/"/, '').gsub(/á/, 'a').
          gsub(/é/, 'e').gsub(/í/, 'i').gsub(/ó/, 'o').gsub(/ú/, 'u')
    end
  end
end
