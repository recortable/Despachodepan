class PagesController < ApplicationController
  caches_page :index, :indice, :lapanaderia, :card, :thumb, :blog, :selection

  def index
    prepare_index(2000)
  end

  def indice
    prepare_index(0)
  end

  def lapanaderia
    prepare_card(Card.find(1))
  end

  def card
    prepare_card Card.find(params[:id])
  end

  def selection
    @selection = CardSelection.new
    render :action => 'selection', :layout => 'grids'
  end

  def blog
    @blog = Blog.new
    render :action => 'blog', :layout => 'grids'
  end

  def thumb
    @slide = SlideImage.find(params[:id])
    render :action => 'thumb', :layout => false
  end

  private
  def prepare_index(time)
    @scroll_time = time
    @cards = Card.includes(:color)
    @tags = Tag.order(:position)
    render :action => 'index', :layout => 'grids'
  end


  # @param card [Card]
  def prepare_card(card)
    @card = card
    @properties = []
    @card.properties.each_line do |line|
      splitted = line.split(%r{:\s})
      splitted[0], splitted[1] = '', splitted[0] if splitted.length == 1
      @properties << splitted
    end

    first = @card.slide_images.first
    first_id = first.nil? ? '0' : first.id
    @show_image = params[:imagen].blank? ? first_id.to_s : params[:imagen]
    render :action => 'card', :layout => 'cards'
  end
end

