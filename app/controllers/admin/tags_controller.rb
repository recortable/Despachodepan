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

  def edit
    edit!
  end

  def new
    new!
  end

  def create
    category = Tag.new params[:tag]
    flash[:notice] = "Categoria #{category.name} creada!" if category.save
    respond_with category, location: admin_tags_path
  end

  def update
    category.attributes = params[:tag]
    update! admin_tags_path
  end

  def destroy
    destroy! admin_tags_path
  end

end
