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
    create! [:edit, :admin, card]
  end

  def update
    update! [:edit, :admin, card]
  end
end
