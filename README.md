# Keeper
Keeper allows a user to generate detailed personality profiles based on a Twitter user's status timeline.

Keeper utilizes Twitter OAuth, and consumes a number of Twitter API endpoints, including:
  - `GET users/show`: to retrieve basic Twitter user profile information
  - `GET users/search`: to permit app users to search for Twitter users by name or username
  - `GET statuses/user_timeline`: to recursively retrieve a Twitter user's publicly-available tweets for  later analysis

To generate personality profiles, Keeper consumes IBM's Personality Insights API.

Keeper is currently in production at https://findakeeper.herokuapp.com/, but if you would like to see the code or contribute to the project, setup instructions are detailed below.

___
### Setup
To launch this application locally, first clone the repository from the following location:

```
$ git clone https://github.com/agpiermarini/keeper.git
```

From the application directory, run the following commands to install and update all gem dependencies:

```
$ bundle
$ bundle update
```

Next, run the following commands to initialize the database and import CSV data:

```
$ rake db:{create,migrate}
```

Spin up a server by running `$ rails s`, and navigate to [local host](http://localhost:3000) in a browser of your choosing.

___
### Contribute

Fork the [repository](https://github.com/agpiermarini/keeper.git) if you would like to contribute to this project. Pull requests will be considered in kind, but please note that contributions must adhere to a test-driven, rebase workflow.

This project uses the RSpec test framework. To run tests locally, you will need to get Twitter and IBM Personality Insights API keys and set the following variables:

- twitter_api_key
- twitter_secret
- twitter_bearer_token ([How to Generate Twitter Bearer Token for App-Only Authentication](https://developer.twitter.com/en/docs/basics/authentication/overview/application-only#issuing-application-only-requests))
- watson_username
- watson_password

Run tests using the standard `$ rspec` command.

#### Database Schema
![](https://github.com/agpiermarini/keeper/tree/master/app/assets/images/schema.png?raw=true)

#### Current Contributors
[Andrew Piermarini](http://www.github.com/agpiermarini)

### Versions
- Ruby 2.4.1  
- Rails 5.1.6
- ActiveRecord 5.1.6
- RSpec-Rails 3.7.2
