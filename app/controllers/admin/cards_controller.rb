class Admin::CardsController < Admin::ApplicationController
  respond_to :html

  expose_resource :card, order: 'updated_at DESC'
 
  def index
    index!
  end

  def edit
    edit!
  end 
end
