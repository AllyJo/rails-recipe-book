class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.includes(:tags)
  end

end
