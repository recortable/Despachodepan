class Admin::SlidesController < Admin::ApplicationController
  inherit_resources
  respond_to :html

  def show
    show!
  end

end
