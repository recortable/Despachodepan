class Admin::TagsController < Admin::ApplicationController
  inherit_resources
  respond_to :html
  before_filter :load_colors

  def index
    @tag = Tag.new
    @tags = Tag.all(:include => [:cards, :color])
    index!
  end

  def show
    redirect_to admin_tags_path
  end

  def create
    create! do |success, failure|
      success.html { redirect_to tags_path }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to tags_path }
    end
  end

  private
  def load_colors
    @colors = Color.all
  end
end
