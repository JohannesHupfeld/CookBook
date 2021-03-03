class RecipesController < ApplicationController
    
    # Renders a form to create a new recipe
    get '/recipes/new' do
      erb :'/recipes/new'
    end

    # Create new recipe
    post '/recipes' do
    
    end

end