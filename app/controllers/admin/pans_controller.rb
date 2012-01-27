class Admin::PansController < Admin::ApplicationController
  respond_to :html
  before_filter :load_parent

  inherit_resources
  has_scope :page, default: 1

  def index
    @columns = [:thumb, :position, :date, :text, :body]
    index!
  end

  protected
  def begin_of_association_chain
    @parent
  end


  def load_parent
    load_card
    @parent = @card ? @card : Site.new
  end

  def load_card
    @card = Card.find(params[:card_id]) if params[:card_id].present?
  end

end

