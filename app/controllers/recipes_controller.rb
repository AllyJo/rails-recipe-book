class RecipesController < ApplicationController

  def index
    # session.delete(:user_id)
    # @recipes = Recipe.all.includes(:tags)
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true).includes(:ingredients, :tags, :creator)
    ep params
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.tags.build
  end

  def create
    @recipe = current_user.created_recipes.create(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      @errors = @recipe.errors.full_messages
      ep @errors
      render 'new'
    end
    # end
  end

  def show
    @recipe = Recipe.includes(:ingredients, :tags).find(params[:id])
  end

  def edit
    @recipe = Recipe.includes(:ingredients, :tags).find(params[:id])
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
