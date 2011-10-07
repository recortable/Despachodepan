class Admin::SlideImagesController < Admin::PansController
  def index
    @columns = [:thumb, :position, :body]
    index!
  end
end

