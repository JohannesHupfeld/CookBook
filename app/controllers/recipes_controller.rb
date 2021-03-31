class RecipesController < ApplicationController  
  # Index route for recipes
  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  # Renders a form to create a new recipe
  get '/recipes/new' do
    erb :'/recipes/new'
  end

  # Create new recipe
  post '/recipes' do # Create new recipe and save it to the DB
    redirecet_if_not_logged_in
    if params[:name] != ""
      @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], instructions: params[:instructions], user_id: current_user.id) 
      flash[:message] = "Tasty! Your recipe was successfully created!"
      redirect "/recipes/#{@recipe.id}" # Redirect to show page
    else
      flash[:errors] = "ERROR...no content added" # Only lasts one http request 
      redirect '/recipes/new'
    end
  end

  # Show route for recipe
  get '/recipes/:id' do
    set_recipe
    erb :'/recipes/show'
  end
  
  # Sends user to edit.erb, which will render an edit form 
  get '/recipes/:id/edit' do
    set_recipe
    redirecet_if_not_logged_in
    if authorized_to_edit?(@recipe)
      erb :'/recipes/edit'
    else
      redirect "users/#{current_user.id}"
    end
  end
  
  # Modify/edit recipe
  patch '/recipes/:id' do
    set_recipe # Find the recipe
    redirecet_if_not_logged_in
    if authorized_to_edit?(@recipe) && if params[:name] != ""
      @recipe.update(name: params[:name], ingredients: params[:ingredients], instructions: params[:instructions]) # Passing a hash(one argument) with values to update
      flash[:message] = "Recipe successfully updated!"
      redirect "recipes/#{@recipe.id}" # Redirect to show page
    end
    else
      flash[:errors] = "ERROR...recipe must contain at least a name"
      redirect "users/#{current_user.id}"
    end
  end

  # Delte recipe
  delete '/recipes/:id' do
    set_recipe
    if authorized_to_edit?(@recipe)
      @recipe.destroy 
      flash[:message] = "Recipe successfully deleted!"
      redirect '/recipes'
    else
      redirect '/recipes'
    end
  end
  
  private # Can only be called from inside this class (recipe class)

  def set_recipe
    @recipe = Recipe.find(params[:id]) # Find the recipe
  end

end
