class Admin::CardsController < Admin::ApplicationController
  respond_to :html

  expose_resource :card, order: 'updated_at DESC'
  expose(:colors) { Color.all }
  expose(:tags) { Tag.all }


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
    flash[:notice] = 'Ficha guardada.' if card.save
    save_main_image(card, params[:main_image_file])
    respond_with card, location: edit_admin_card_path(card)
  end

  def update
    flash[:notice] = 'Ficha guardada.' if card.update_attributes(params[:card])
    save_main_image(card, params[:main_image_file])
    respond_with card, location: edit_admin_card_path(card)
  end

  def destroy
    destroy! admin_cards_path
  end

  protected
  def save_main_image(card, image)
    MainImage.create!(card: card, file: image)
  end
end
