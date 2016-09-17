class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
 
  def set_locale
    # TODO: Update to set based on user preferences
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
