class RecipesController < ApplicationController  
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
      @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], instructions: params[:instructions], user_id: current_user.id) 
      redirect "/recipes/#{@recipe.id}" # Redirect to show page
    else
      redirect '/recipes/new'
    end
  end

  get '/recipes/:id' do
    set_recipe
    if logged_in?
      if @recipe.user == current_user
        erb :'/recipes/show'
      else
        redirect "users/#{current_user.id}"
      end
    else
      redirect '/'
    end
  end
  
  # Sends user to edit.erb, which will render an edit form 
  get '/recipes/recipes/:id/edit' do
    set_recipe
    erb :'/recipes/edit'
  end
  
  # Modify/edit recipe
  patch '/recipes/:id' do
    set_recipe # Find the recipe
    if logged_in?
      if @recipe.user == current_user
        @recipe.update(name: params[:name], ingredients: params[:ingredients], instructions: params[:instructions]) # Passing a hash(one argument) with values to update
        redirect "recipes/#{@recipe.id}" # Redirect to show page
      else
        redirect "users/#{current_user.id}"
    else
      redirect '/'
    end
  end
  
  private

  def set_recipe
    @recipe = Recipe.find(params[:id]) # Find the recipe
  end
end