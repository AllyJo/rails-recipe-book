class User < ApplicationRecord

  has_many :user_recipes
  has_many :favorites, through: :user_recipes, source: 'recipe'


  has_many :created_recipes, class_name: 'Recipe', foreign_key: :creator_id
  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
end
