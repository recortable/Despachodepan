class Admin::PansController < Admin::ApplicationController
  respond_to :html
  before_filter :load_parent

  inherit_resources
  has_scope :page, default: 1

  def index
    index!
  end

  protected
  def begin_of_association_chain
    @parent
  end

  def load_parent
    @parent = params[:card_id].present? ? Card.find(params[:card_id]) : Site.new
  end

end

