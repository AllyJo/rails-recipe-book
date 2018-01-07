class RecipesController < ApplicationController

  def index
    # session.delete(:user_id)
    @recipes = Recipe.all.includes(:tags)
  end

  def new
    @recipe = Recipe.new
  end
  def create
    @recipe = Recipe.includes(:ingredients, :tags).create(recipe_params)
    # if @recipe.creator == current_user
      if @recipe.save
      redirect_to recipes_path
      end
    else
      @errors = @recipe.errors.full_messages
      render 'new'
    # end
  end

  def show
    @recipe = Recipe.includes(:ingredients, :tags).find(params[:id])
  end

  def edit
    @recipe = Recipe.includes(:ingredients, :tags).find(params[:id])
    @recipe.ingredients.build
    @recipe.tags.build
  end


  def update
    @recipe = Recipe.includes(:ingredients, :tags).find(params[:id])
    if @recipe.creator == current_user
      if @recipe.update_attributes(recipe_params)
        flash[:notice] = "Recipe Updated"
        redirect_to recipe_path(@recipe)
      end
    else
      @errors = @recipe.errors.full_messages
      flash[:notice] = "Recipe not updated..."
      render 'edit'
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :cooking_time, :cooking_style, :creator_id, ingredients_attributes: [:id, :amount, :name], tags_attributes: [:id, :body])
  end

end
