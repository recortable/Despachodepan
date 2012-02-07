class Admin::ColorsController < Admin::ApplicationController

  expose_resource :color
  respond_to :html

  def index
    index!
  end

  def edit
    edit!
  end

  def create
    create! admin_colors_path
  end

  def update
    update! admin_colors_path
  end

  def destroy
    destroy! admin_colors_path
  end
end
