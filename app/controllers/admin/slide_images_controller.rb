# Fotos y vídeos en cada ficha
# /admin/fichas/[:id]/images
#
class Admin::SlideImagesController < Admin::PansController
  expose_resource :slide_image
  expose(:slide_images) { parent.slide_images }

  def index
    @columns = [:thumb, :position, :extra, :body]
    index!
  end

  def new
    new!
  end


end

