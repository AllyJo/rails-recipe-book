class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @created_recipes = @user.created_recipes.find_by(params[:created_recipe])
    @favorites = @user.favorites.find_by(params[:favorites])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
