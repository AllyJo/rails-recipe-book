class AddCreatorIdToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :creator_id, :integer
  end
end
