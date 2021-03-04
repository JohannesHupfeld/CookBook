require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# in order to send PATCH and DELETE requests
use Rack::MethodOverride # Allows me to change the http verb of a request
use RecipesController
use UsersController
run ApplicationController