# SlideImageco
# /admin/fichas/[:id]/images
#
class Admin::SlideImagesController < Admin::PansController
  def index
    @columns = [:thumb, :position, :extra, :body]
    index!
  end
end

