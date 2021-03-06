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
    if !logged_in?
      redirect '/'
    end
    if params[:name] && params[:ingredients] && params[:instructions] != ""
      flash[:message] = "Tasty!! Recipe successfully created!"
      @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], instructions: params[:instructions], user_id: current_user.id) 
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
  get '/recipes/recipes/:id/edit' do
    set_recipe
    if logged_in?
      if authorized_to_edit?(@recipe)
        erb :'/recipes/edit'
      else
        redirect "users/#{current_user.id}"
      end
    else
      redirect '/'
    end
  end
  
  # Modify/edit recipe
  patch '/recipes/:id' do
    set_recipe # Find the recipe
    if logged_in?
      if authorized_to_edit?(@recipe) && if params[:name] != ""
          flash[:message] = "Recipe successfully updated!"
          @recipe.update(name: params[:name], ingredients: params[:ingredients], instructions: params[:instructions]) # Passing a hash(one argument) with values to update
          redirect "recipes/#{@recipe.id}" # Redirect to show page
        end
      else
        flash[:errors] = "ERROR...recipe must contain at least a name"
        redirect "users/#{current_user.id}"
      end
    else
      redirect '/'
    end
  end

  # Delte recipe
  delete '/recipes/recipes/:id' do
    set_recipe
    if authorized_to_edit?(@recipe)
      @recipe.destroy 
      redirect '/recipes'
    else
      redirect '/recipes'
    end
  end
  
  private

  def set_recipe
    @recipe = Recipe.find(params[:id]) # Find the recipe
  end

end
