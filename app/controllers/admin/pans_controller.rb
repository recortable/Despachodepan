class Admin::PansController < Admin::ApplicationController
  respond_to :html

  expose(:card) { Card.find(params[:card_id]) if params[:card_id].present? }
  expose(:parent) { card.present? ? card : Site.new}

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

end

