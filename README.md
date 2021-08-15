# Contacts App!

An app which lets you have all your contacts imported with CSV files, and then processed to became part of your list!

Heroku URL: https://contacts-app-samo.herokuapp.com/

Technologies and Gems:
- Ruby on Rails 6.0.4.
- Sidekiq for Async Jobs.
- Redis as adapter for Sidekiq.
- Postgresql as Database.
- DotEnv for enviroment vars.
- Rspec and FactoryBot for testing.
- Styling with Bootstrap and Sass
- AWS S3 as cloud storage.
- Heroku as production server.

# Set enviroment

As the application uses Rails and Ruby, the minimum requirements are:

- Install Ruby at least, 2.6.8 and upper (RVM can be used)
- Install gem bundler with `gem install bundler`
- Install Redis server to use as async queue -> [Instructions](https://flaviocopes.com/redis-installation/)
- Install Postgresql -> [Instructions](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04-es)
- Install Yarn -> [Instructions](https://classic.yarnpkg.com/en/docs/install/#debian-stable)

You must create too an .env file with the following vars

- AWS_BUCKET=
- ACCESS_KEY_AWS=
- SECRET_ACCESS_AWS=
- AWS_REGION=

Before all of this, use `bundle install` to install all the needed gems to run the app

## Database Setup
To setup the db, you must have an user and a database named as the user ([Instructions](https://phoenixnap.com/kb/how-to-install-postgresql-on-ubuntu)), then, run these commands on the shell/bash:

- `rails db:setup` Creates dev and tests db.
- `rails db:migrate` Run the migrations present in the app

## Launching server
The server is configured by default on localhost:3000, you can change it directly on the config. The following commands will help you to launch the server.

 - `rails s` launches the server
 - `redis-server` launches redis
 - `sidekiq` launches sidekiq for background jobs

Before this, you should be able to go to http://locahost:3000 and see the app working.

## Database modeling

![You can rename the current file by clicking the file name in the navigation bar or by clicking the **Rename** button in the file explorer.](https://i.imgur.com/nF3ggdC.png)

## Run tests

You can run the tests of the app simply by writing `rspec`, which runs all the tests, or can choose a file by passing the route of it as argument eg: `rspec spec/controllers/contacts_controller_spec.rb`