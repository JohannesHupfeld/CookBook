### Notes
- seperation of concerns, everything should have one job.
- redirect vs render =  

- get requests show us something (erb/render) else we redirect

- cant put a flash message inside a route that ends in an erb, they last one http request and are not available until you fire that http request 
  - When refreshing the page you're sending a get request not post request therefore code still runs but message does not post
 
- Params hash = collection of data thats come through your application in a request.