class Admin::PansController < Admin::ApplicationController
  respond_to :html
  before_filter :load_parent

  def index
    @columns = [:thumb, :position, :date, :text, :extra, :body]
    index!
  end

  def show
    show!
  end

  def edit
    edit!
  end

  def new
    new!
  end

  def create
    create! [:admin, resource]
  end

  def update
    update! [:admin, resource]
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

