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

end
