class Admin::CardFilesController < Admin::ApplicationController
  respond_to :html

  expose_resource :card_file
  expose(:card_files) { parent.card_files }

  def index
    index!
  end

end
