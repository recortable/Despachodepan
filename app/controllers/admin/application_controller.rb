class Admin::ApplicationController < ApplicationController
  layout 'admin'
  before_filter :require_user

  expose(:card) { Card.find params[:card_id] if params[:card_id].present? }
  expose(:parent) { card.nil? ? Site.new : card }

  protected
  def require_user
    unless Rails.env.test?
      authenticate_or_request_with_http_basic do |username, password|
        APP_CONFIG['users'].include?(username) and password == APP_CONFIG['password']
      end
    end
  end

  # @param card [Card]
  def expire_all_card_pages_cache(card)
    expire_card_page_cache(card)

    [:index, :indice].each do |action|
      expire_page :controller => 'pages', :action => action
    end

    card.slide_images.each { |slide| expire_slide_image_cache(slide) }
  end

  def expire_card_page_cache(card)
    expire_page :controller => 'pages', :action => 'card', :id => card.slug
  end


end
