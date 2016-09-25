class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :set_current_user
 
  def set_locale
    # TODO: Update to set based on user preferences
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])

      # session has a user_id, but we can't find it... Invalidate session...
      reset_session if !@current_user
    end
  end
end
