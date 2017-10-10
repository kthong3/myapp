class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def logged_in?
    session[:user_id] != nil
  end

  def authenticate!
    redirect '/sessions/new' unless logged_in?
  end

  def authorize!(user)
    redirect '/not_authorized' unless authorized?(user)
  end

  def authorized?(user)
    current_user == user
  end

  def master?
    current_user.id == 1
  end
end
