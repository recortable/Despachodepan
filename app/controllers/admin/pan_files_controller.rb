class Admin::PanFilesController < Admin::ApplicationController
  respond_to :html

  expose_resource :pan_file
  expose(:pan_files) { parent.pan_files }

  def index
    index!
  end

  def new
    new!
  end

  def edit
    edit!
  end

  def create
    create! admin_card_pan_files_path(card)
  end

  def update
    update! admin_card_pan_files_path(card)
  end

  def destroy
    destroy! admin_card_pan_files_path(card)
  end

end
