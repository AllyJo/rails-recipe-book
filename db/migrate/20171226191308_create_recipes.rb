class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :instructions
      t.string :cooking_time
      t.string :cooking_style

      t.timestamps
    end
  end
end
