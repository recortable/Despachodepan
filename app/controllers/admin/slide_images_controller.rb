# Fotos y vídeos en cada ficha
# /admin/fichas/[:id]/images
#
class Admin::SlideImagesController < Admin::PansController
  expose_resource :slide_image
  expose(:slide_images) { parent.slide_images.reorder('position DESC') }

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
    expire_slide_image_cache(slide_image)
  end

  def update
    update! admin_card_slide_images_path(card)
    expire_slide_image_cache(slide_image)
  end

  def destroy
    destroy! admin_card_slide_images_path(card)
    expire_slide_image_cache(slide_image)
  end

  def reorder
    slide_images.each_with_index do |slide, index|
      slide.update_attribute(:position, index + 1)
      expire_page :controller => 'pages', :action => 'thumb', :id => slide.id
    end
    expire_page :controller => 'pages', :action => 'card', :id => card.slug
    redirect_to admin_card_slide_images_path(card)
  end

  def expire_slide_image_cache(slide)
    expire_page :controller => 'pages', :action => 'card', :id => card.slug
    expire_page :controller => 'pages', :action => 'thumb', :id => slide.id
  end

end

