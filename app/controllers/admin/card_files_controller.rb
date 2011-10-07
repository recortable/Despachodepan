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
    load_card
    @parent = @card ? @card : Site.new
  end

  def load_card
    @card = Card.find(params[:card_id]) if params[:card_id].present?
  end


end
