class SessionsController < ApplicationController

  def new
    @user = User.find_by(email: params[:email])
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    # User.find(session[:user_id]).destroy
    # session[:user_id] = nil
    session.delete(:user_id)
    redirect_to root_path
  end
end
