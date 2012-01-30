class Admin::CardsController < Admin::ApplicationController
  respond_to :html

  expose_resource :card, order: 'updated_at DESC'
  expose(:colors) { Color.all }
  expose(:tags) { Tag.all }
 
  def index
    index!
  end

  def edit
    edit!
  end 
end
