# Fotos y vídeos en cada ficha
# /admin/fichas/[:id]/images
#
class Admin::SlideImagesController < Admin::PansController
  expose_resource :slide_image
  expose(:slide_images) { parent.slide_images.order('position ASC') }

  def index
    @columns = [:thumb, :position, :extra, :body]
    index!
  end

  def show
    show!
  end

  def new
    new!
  end

  def create
    create! admin_card_slide_images_path(card)
  end

  def update
    update! admin_card_slide_images_path(card)
  end

  def destroy
    destroy! admin_card_slide_images_path(card)
  end
end

