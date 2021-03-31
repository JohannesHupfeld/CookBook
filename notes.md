### Notes
- seperation of concerns, everything should have one job.
- redirect vs render =  you have access to any instance variables created  within that block of code when you render a page when you use erb. we use redirect becuase the only job for post users is to create a user not to show you the user therefore redirect "users/#{@user.id}" send you to the get request of get '/users/:id' to show you the user. (post signup)
post request usually redirect and get render(erb).


- get requests show us something (erb/render) else we redirect

- cant put a flash message inside a route that ends in an erb, they last one http request and are not available until you fire that http request 
  - When refreshing the page you're sending a get request not post request therefore code still runs but message does not post
 
- Params hash = collection of data that comes through your application in a request.

- (recipes INDEX.erb) I am itterating through all my recipes (@recipes.each) so recipe inside the block 
  is represented by the variable recipe ( |recipe| ) which is a local variable (block scoped variable) and it represents a particular recipe.

  @user = instance variable!!!!!!

  ||= (or equals)

  ? on helper methods becuase it returns a boolean