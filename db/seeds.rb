User.destroy_all
Recipe.destroy_all
RecipeTag.destroy_all
RecipeIngredient.destroy_all
UserRecipe.destroy_all

User.create!(username: 'Tom', email: 'tom@tom.com', password: 'tom')
User.create!(username: 'Ally', email: 'ally@ally.com', password: 'ally')
chicken = Recipe.create!(name: 'BBQ Chicken', instructions: 'Preheat convection oven to 375. Coat chicken breast with bbq sauce. Place chicken breast on lined baking sheet. Rest for 10 minutes before serving', cooking_time: '45 minutes', cooking_style: 'baked', creator: User.first)
chicken.ingredients.create!(name: 'chicken breast', amount: '2')
chicken.ingredients.create!(name: 'Sugar-free bbq sauce', amount: '1/2 cup')
keto = chicken.tags.create!(body: 'keto')
