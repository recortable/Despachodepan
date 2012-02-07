class Admin::PanFilesController < Admin::ApplicationController
  respond_to :html

  expose_resource :pan_file
  expose(:pan_files) { parent.pan_files }

  def index
    index!
  end

  def edit
    edit!
  end

end
