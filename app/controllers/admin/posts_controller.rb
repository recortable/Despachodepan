# Noticias
class Admin::PostsController < Admin::PansController
  respond_to :html

  expose_resource :post
  expose(:posts) { Post.order('rev_date DESC')}

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
    create! admin_posts_path
    expire_cache
  end

  def update
    update! admin_posts_path
    expire_cache
  end

  def destroy
    destroy! admin_posts_path
    expire_cache
  end

  protected
  def expire_cache
    expire_page posts_path
    expire_page root_path
  end
end

