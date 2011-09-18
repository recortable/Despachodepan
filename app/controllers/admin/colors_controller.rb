class Admin::ColorsController < Admin::ApplicationController
  inherit_resources
  respond_to :html

  def index
    @color = Color.new
    index!
  end
end
