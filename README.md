# Sinatra CookBook

A simple Recipe Cook Book Sinatra application in which anyone can create an account with a name, email and password. they can then login to their account and create a recipe, see all recipes in the recipe index and they can also edit and delete their own recipes. 

## Installation

Clone the repo and install dependcies

```bash
$ git clone https://github.com/JohannesHupfeld/CookBook
$ bundle install
```
Migrate

```bash
$ rake db:migrate
```
## Development

After installation, run

```bash
rake db:migrate SINATRA_ENV=test
```
To Launch the developement server, run

```bash
$ shotgun 
```

..the app should be running on 'localhost:9393' by default.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JohannesHupfeld/CookBook. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The code is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sinatra-CRUD project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/JohannesHupfeld/CookBook/blob/master/CODE_OF_CONDUCT.md).