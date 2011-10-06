class Admin::SelectionsController < Admin::SlidesController
  defaults resource_class: Slide, collection_name: 'slides', instance_name: 'slide'


  def index
    @slides = begin_of_association_chain.selections
    index!
  end
  
  def show
    @slide = begin_of_association_chain.selections.find params[:id]
    show!
  end

end
