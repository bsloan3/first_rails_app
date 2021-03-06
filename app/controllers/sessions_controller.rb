class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id]  = @user.id
      redirect_to "/"
    else
      if @user
        @errors = "Sorry, wrong password. Please try again."
        render "/sessions/new"
      else
        @errors = "Sorry, wrong email. Please try again."
        render "/sessions/new"
      end
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to '/'
  end
end
