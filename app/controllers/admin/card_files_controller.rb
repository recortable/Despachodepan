class Admin::CardFilesController < Admin::ApplicationController
  respond_to :html
  inherit_resources
  has_scope :page, default: 1

  before_filter :load_parent

  def destroy
    destroy!{ [:admin, @parent] }
  end

  protected
  def begin_association_chain
    @parent
  end

  def load_parent
    @parent = params[:card_id].present? ? Card.find(params[:card_id]) : Site.new
  end


end
