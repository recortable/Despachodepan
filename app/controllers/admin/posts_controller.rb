# Noticias
class Admin::PostsController < Admin::PansController
  respond_to :html

  expose_resource :post

  def index
    @columns = [:thumb, :body, :date]
    index!
  end

  def show
    show!
  end

  def new
    new!
  end

  def create
    post.card_id = 1
    create! [:admin, :posts]
  end

  def update
    update! [:admin, :posts]
  end
end

