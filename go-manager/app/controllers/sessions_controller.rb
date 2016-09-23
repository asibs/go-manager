class SessionsController < ApplicationController
  
  def create
    # Reset session to prevent session fixation attacks: http://guides.rubyonrails.org/security.html#session-fixation
    reset_session

    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    
    redirect_to root_url
  end

  def destroy
    reset_session
    @current_user.logout

    redirect_to root_url
  end

end
