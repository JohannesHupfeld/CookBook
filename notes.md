### Notes
- seperation of concerns, everything should have one job.
- redirect vs render =  

- get requests show us something (erb/render) else we redirect

- cant put a flash message inside a route that ends in an erb, they last one http request and are not available until you fire that http request 
  - When refreshing the page you're sending a get request not post request therefore code still runs but message does not post
 
- Params hash = collection of data that comes through your application in a request.

- (recipes INDEX.erb) I am itterating through all my recipes (@recipes.each) so recipe inside the block 
  is represented by the variable recipe ( |recipe| ) which is a local variable (block scoped variable) and it represents a particular recipe.

  @user = instance variable!!!!!!