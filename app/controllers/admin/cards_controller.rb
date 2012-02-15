class Admin::CardsController < Admin::ApplicationController
  respond_to :html

  expose_resource :card, order: 'updated_at DESC'
  expose(:colors) { Color.all }
  expose(:tags) { Tag.all }

  cache_sweeper :card_sweeper


  def index
    index!
  end

  def show
    redirect_to action: :edit
  end

  def edit
    edit!
  end

  def new
    new!
  end

  def create
    if card.save
      flash[:notice] = 'Ficha guardada.'
      save_main_image(card, params[:main_image_file])
    end
    respond_with card, location: edit_admin_card_path(card)
  end

  def update
    if card.update_attributes(params[:card])
      flash[:notice] = 'Ficha guardada.'
      save_main_image(card, params[:main_image_file])
    end
    respond_with card, location: edit_admin_card_path(card)
  end

  def destroy
    if card.destroy
      flash[:notice] = 'Ficha borrada.'
    end
    respond_with card, location: admin_cards_path
  end

  protected
  def save_main_image(card, image)
    if image.present?
      puts "Saving image..."
      MainImage.create!(card: card, file: image)
    end
  end
end
