class Admin::CardFilesController < Admin::ApplicationController
  respond_to :html

  expose_resource :card_file
  expose(:card) { Card.find params[:card_id] }
  expose(:card_files) { card.card_files }

  def index
    index!
  end

end
