User.destroy_all
Recipe.destroy_all
RecipeTag.destroy_all
RecipeIngredient.destroy_all
UserRecipe.destroy_all

tom = User.create!(username: 'Tom', email: 'tom@tom.com', password: 'tom')
ally = User.create!(username: 'Ally', email: 'ally@ally.com', password: 'ally')
chicken = Recipe.create!(name: 'BBQ Chicken', instructions: 'Preheat convection oven to 375. Coat chicken breast with bbq sauce. Place chicken breast on lined baking sheet. Rest for 10 minutes before serving', cooking_time: '45 minutes', cooking_style: 'baked', creator: User.first)
chicken.ingredients.create!(name: 'chicken breast', amount: '2')
chicken.ingredients.create!(name: 'Sugar-free bbq sauce', amount: '1/2 cup')
keto = chicken.tags.create!(body: 'keto')
tuna = Recipe.create!(name: 'Tuna Fish Casserole', instructions: 'Preheat oven to 375. Mix cheese, sour cream, mayo, and seasoning together in a bowl. Drain tuna fish of liquid. Place frozen broccoli in bottom of baking dish. Crumble tuna over broccoli. Spread cheese mixture over tuna. Top with pork rinds and drizzle melted butter. Let sit for 10 minutes before serving.', cooking_time: '45 minutes', cooking_style: 'baked', creator: User.second)
tuna.ingredients.create!(name: 'Tuna Fish', amount: '20 oz.')
tuna.ingredients.create!(name: 'Eggs', amount: '6')
tuna.ingredients.create!(name: 'Shredded Cheddar Cheese', amount: '16 oz.')
tuna.ingredients.create!(name: 'Butter', amount: '1/2 cup')
tuna.ingredients.create!(name: 'Pork Rinds(crushed)', amount: '3 oz.')
tuna.ingredients.create!(name: 'Broccoli (frozen)', amount: '10 oz.')
tuna.ingredients.create!(name: 'Sour Cream', amount: '1 cup')
tuna.ingredients.create!(name: 'Mayo', amount: '1/2 cup')
tuna.ingredients.create!(name: 'Pepper', amount: '1 Tbsp.')
tuna.ingredients.create!(name: 'Salt', amount: '3 Tsp.')
tuna.ingredients.create!(name: 'Garlic Powder', amount: '1 Tsp.')
tuna.ingredients.create!(name: 'Ranch Mix (powder)', amount: '1 Tsp.')
tuna.tags.create!(body: 'keto')
