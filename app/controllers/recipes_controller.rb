class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.includes(:tags)
  end
  def new
    @recipe = Recipe.new
  end
  def create
    # @user = User.find_by(id: params[:user_id])
    @recipe = Recipe.includes(:ingredients, :tags).new(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else

      @errors = @recipe.errors.full_messages
      ep @errors
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @recipe = Recipe.includes(:ingredients, :tags).find(params[:id])
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @recipe = Recipe.includes(:ingredients, :tags).find(params[:id])
  end


  def update
    @user = User.find_by(id: params[:user_id])
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :cooking_time, :cooking_style)
  end



end
