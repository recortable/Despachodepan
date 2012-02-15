class Admin::MainImagesController < Admin::ApplicationController
  respond_to :html
  expose_resource :main_image

  def destroy
    destroy! edit_admin_card_path(card)
    if card.main_image_id.present?
      card.update_attribute(:main_image_id, nil)
    end
  end
end