class Recipe < ApplicationRecord
  has_many :user_recipes
  has_many :users, through: :user_recipes

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  has_many :recipe_tags
  has_many :tags, through: :recipe_tags

  belongs_to :creator, class_name: 'User'

  accepts_nested_attributes_for :ingredients, :tags
end
