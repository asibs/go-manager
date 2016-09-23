class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :set_current_user
 
  def set_locale
    # TODO: Update to set based on user preferences
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
