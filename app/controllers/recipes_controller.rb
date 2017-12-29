class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.includes(:tags)
  end

  def create
    @creator = Recipe.find_by(recipe_params[:creator])
    @recipe = @creator.recipes.new(recipe_params)
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :cooking_time, :cooking_style, :creator)
  end



end
