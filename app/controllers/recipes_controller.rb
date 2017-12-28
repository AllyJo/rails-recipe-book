class RecipesController < ApplicationController

  def index
    Recipe.all.includes(:tags)
  end


end
