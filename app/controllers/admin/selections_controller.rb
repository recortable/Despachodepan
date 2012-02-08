class Admin::SelectionsController < Admin::PansController
  expose_resource :selection
  expose(:selections) { parent.selections }

  def index
    @columns = [:thumb, :date, :extra, :body, :card]
  end

  def new
    new!
  end

  def edit
    edit!
  end

  def create
    create! admin_selections_path
  end

  def update
    update! admin_selections_path
  end

  def destroy
    destroy! admin_selections_path
  end
end

