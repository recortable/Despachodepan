class Admin::PostsController < Admin::PansController

  def index
    @columns = [:thumb, :body, :date]
    index!
  end

end

