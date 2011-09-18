class Admin::PositionsController < ApplicationController
  before_filter :load_resource
  respond_to :html

  def update
    move = params[:move]
    if move == 'top'
      @resource.move_to_top
    elsif move == 'bottom'
      @resource.move_to_bottom
    elsif move == 'up'
      @resource.move_higher
    elsif move == 'down'
      @resource.move_lower
    end
    respond_with [:admin, @resource]
  end

  private
  def load_resource
    @resource = Slide.find params[:slide_id] if params[:slide_id].present?
    @resource = Tag.find params[:tag_id] if params[:tag_id].present?
    @resource ||= Card.find -1
  end
end
