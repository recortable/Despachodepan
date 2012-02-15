class Admin::PositionsController < ApplicationController
  before_filter :load_resource
  respond_to :html

  def update
    load_resource
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
    if params[:url].present?
      redirect_to params[:url]
    else
      respond_with [:admin, @resource]
    end
  end

  private
  def load_resource
    @resource = Pan.find params[:pan] if params[:pan].present?
    @resource = Tag.find params[:tag] if params[:tag].present?
    @resource ||= Card.find -1
  end
end
