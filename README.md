# Welcome to Grocery delivery platform

## Technologies

* API-only, Rails 7, Postgres
* Rubocop for code style. Run `rubocop` before pushing to repository to avoid offenses.

## Installation

Assuming you're running on a mac or some flavor of Linux:
* Install postgres if you don't have it
* Start postgres if it isn't running
* Install ruby v`3.0.0` if you don't already have it
* Use your ruby environment manager of choice (.rvm, .rb_env, etc) to create and then run a 'grocery_delivery_system' ruby environment under ruby-3.0.0
* run `bundle` to install necessary gems
* Create the database files (`rails db:create`)
* [Setup Credentials](##setup-credentials)
* Run any pending database migrations (`rails db:migrate`)
* Seed database (`rails db:seed`)
* Start rails server (`rails s`)
* Test the app is running OK by going to http://localhost:3000/

## Setup Credentials

To setup credentials we use `multi environments`. It provides utility to easily create and use environment specific credentials. Each of these have their own encryption keys: `development.key` is for `development.yml.enc`, `test.key` is for `test.yml.enc`, `production.key` is for `production.yml.enc`. `Development.key & production.key & test.key` are in .gitignore so ask to provide them to be able to use environment credentials. Put these files into `config/credentials`.
For creating or editing environment credentials use this command: `EDITOR=nano|vim rails credentials:edit --environment production|development|test`

## TODO list

* Refreshing tokens for auth
* Specs with RSpec
