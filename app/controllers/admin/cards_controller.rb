class Admin::CardsController < Admin::ApplicationController
  inherit_resources
  respond_to :html

  def index
    @colors = Color.all
    @cards = Card.all(:include => [:color, :main_image, :main_slide, :tags])
    index!
  end
  
  def find
    card = Card.find_by_url!(params[:id])
    redirect_to edit_admin_card_path(card)
  end

  def show
    redirect_to edit_admin_card_path(@card)
  end

  def edit
    prepare_edit
    edit!
  end

  private
  def prepare_edit
    @card = Card.find(params[:id]) if @card.nil?
    @tags = Tag.all
    @colors = Color.all
    @photo = @card.slides.build(:rol => 'slide')
    @news = @card.slides.build(:rol => 'news')
    @selected = @card.slides.build(:rol => 'selection')
    @card_file = CardFile.new(:card_id => @card.id)
  end
end
