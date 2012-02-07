class Admin::SelectionsController < Admin::PansController
  expose_resource :selection
  expose(:selections) { parent.selections }
end

