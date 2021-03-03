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
        redirect "/recipes/#{@recipe.id}"
      else
        redirect '/recipes/new'
      end
    end

    
end