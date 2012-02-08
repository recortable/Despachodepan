class Admin::MainImagesController < Admin::ApplicationController
  respond_to :html
  expose_resource :main_image

  def destroy
    destroy! edit_admin_card_path(card)
  end
end