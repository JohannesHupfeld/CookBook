# Here is where I will create some seed data to work with and test associations

# Create 2 users

joey = User.create(name: "Joey", email: "joey@joey.com", password: "password")
alex = User.create(name: "Alex", email: "alex@alex.com", password: "password")

# Create some recipes

Recipe.create(name: "cereal", ingredients: "cereal, milk", instructions: "pour cereal into bowl then pour milk on top", user_id: alex.id)

# Use Active Record to pre-associate data:

joey.recipes.create(name: "hot chocolate", ingredients: "milk, chocolate powder", instructions: "heat up milk then mix in chocolate powder")

alexs_recipes = alex.recipes.build(name: "peanut butter & jelly sandwhich", ingredients: "bread, peanut butter, jelly", instructions: "spread peanut butter and jelly on bread")
alexs_recipes.save