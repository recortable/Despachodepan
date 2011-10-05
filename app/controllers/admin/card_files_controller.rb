class Admin::CardFilesController < Admin::ApplicationController
  respond_to :html
  expose(:resource_class) { CardFile }
  expose(:page) { params[:page].present? ? params[:page] : 1 }
  expose(:parent) {params[:card_id].present? ? Card.find(params[:card_id]) : Site.new}
  expose(:card_files) { parent.card_files.page(page) }

end
