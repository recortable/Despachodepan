class Admin::CardsController < Admin::ApplicationController
  inherit_resources
  respond_to :html

  def index
    @colors = Color.all
    @cards = Card.all(:include => [:color, :main_image, :main_slide, :tags])
    index!
  end
end
