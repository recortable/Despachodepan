class ApplicationController < ActionController::Base
  protect_from_forgery
  include Extensions::ExposeResource

  protected

  # @param card [Card]
  def expire_page_cache(card)
    expire_page :controller => 'pages', :action => 'card', :id => card.url
    [:index, :indice, :lapanaderia, :selection, :actual].each do |action|
      url = url_for(:controller => 'pages', :action => action)
      expire_page :controller => 'pages', :action => action
    end

    card.photos.each do |slide|
      expire_page :controller => 'pages', :action => 'thumb', :id => slide.id
    end
  end

end
