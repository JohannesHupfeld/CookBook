# App Overview
```bash
I am building an app in which a user can create a recipe and store it in a virtual CookBook
```
# User Stories
## Users will be able to...
```bash
Signup
Login
Logout
```
## As a user I can...
```bash
Create a recipe
See all my recipes
Edit my recipes
Delete my recipes
```
# Wireframing
## Models
```bash
User
Recipe
```
## User
### Attriburtes
-     name
-     email
-     password_digest (digest because using bcrypt)
### Associations
-     has_many :recipes
## Recipe
### Attributes
-     Name
-     Ingredients
-     Instructions
### Associations
-     belongs_to :user
# MVP
```bash
Sinatra MVC application in which a user can signup, login, and logout. In the app the user can create recipes which can be viewed, edited and deleted.
```


# Stretch Goals
-     CSS (make the app visually appealing)
-     Tests
-     Include a join model 
-     The user has a recipe page which lists all the recipes in his cookbook, when you click on the recipe name it takes you to another page with the intructions on how to make that recipe. Have a recipe and an instructions model. 