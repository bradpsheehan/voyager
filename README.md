# Welcome to Voyager

Voyager is a simple mobile-friendly job application portal.

You can kick the tires here:
https://job-voyager.herokuapp.com/

### Prerequisites
ruby '2.5.1': Install ruby using your ruby version manager of choice (e.g. chruby, rvm)
rails 5.2: `gem install rails`
yarn: `brew install yarn`

### Setup
Install gems: `bundle install`

Initialize NodeJS modules: `yarn install`

Initialize database: `bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed`

Start rails server: `rails s`

Start webpack dev server: `./bin/webpack-dev-server`

Start using app at: `localhost:3000`

### TODO
* Add tests (rspec, jest)

* Integrate with Facebook for applicant info/login

* Add A/B test for 'years of experience' page

* Add Analytics for completion rate
