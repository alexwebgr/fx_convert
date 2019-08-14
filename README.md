# FX convert
A simple currency converter app, built with Ruby on Rails and postgresql. 

#### Instructions for running the app locally
Firstly you will need ruby installed ideally by using a version manager like [rbenv](https://github.com/rbenv/rbenv)
that lets you have different versions of ruby per directory. This app is using Ruby 2.5.1 and Rails 5.2.3 
it is also depending on postgresql to be installed on the host machine.

Run `bundle install` to install all the gems listed in the Gemfile.

#### Encrypted credentials
I am using encrypted credentials in order to safely store and commit the database credentials along with the api keys.
You will need to two `.key` files placed next to the encrypted yaml file `master.key` and `<env>.key`.
It is also possible to re-create the encrypted yml files with the same command as one for the edit 
but do bare in mind that the credentials will be lost and the values need to have the same key names as described in `config/application.yml`.     

In order to edit the `.yml.enc` you will need to run `EDITOR="nano" bin/rails encrypted:edit config/development.yml.enc --key config/development.key`
or `EDITOR="nano" bin/rails encrypted:edit config/production.yml.enc --key config/production.key` for the production env. 

#### Database
A visual representation of the database is available under the `schema.xml` file just navigate 
  to this [URL](https://ondras.zarovi.cz/sql/demo/) and paste the contents of the file in the load window.

Make sure that the database credentials listed in `config/development.yml.enc` match the ones for the local database user. 
In order to create the database run `rails db:create` followed by `rails db:schema:load`

#### How to run the test suite
In order to run the test suite just run `bundle exec rspec`

#### Starting the app
You can start the application server called 'Puma' by  running `rails s` in your terminal and stop it by hitting `CTRL + c`.
After making any changes to configuration the server has to be restarted for the changes to take effect. 

#### Improvements
* Update the rate in realtime by using websockets
