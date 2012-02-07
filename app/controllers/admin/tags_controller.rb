class Admin::TagsController < Admin::ApplicationController
  respond_to :html

  expose_resource :tag, as: :category
  expose(:categories) { Tag.includes(:cards, :color)}
  expose(:category)
  expose(:colors) { Color.all }


  def index
    index!
  end

  def show
    redirect_to admin_tags_path
  end

  def create
    create! admin_tags_path
  end

  def update
    update! admin_tags_path
  end

end
