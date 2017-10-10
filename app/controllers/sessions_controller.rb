class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct
    if @user && @user.authenticate(params[:password])
      # save the user id insde the browser cookie
      # this is how we keep the user logged in when they navigate around our website
      session[:user_id] = @user.id
      redirect_to root_path
    else
      # if login doesn't work, go back to login form
      @message = "Either your email or password was incorrect."
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end

end
