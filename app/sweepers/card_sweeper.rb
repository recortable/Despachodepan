class CardSweeper < ActionController::Caching::Sweeper
  observe Card

  def after_update(card)
    expire_page card_path(card)
    expire_page projects_path
  end
end