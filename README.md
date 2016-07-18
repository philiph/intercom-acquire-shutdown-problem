Intercom Acquire - example of shutdown problem
==============================================

Simple example web app, written in Ruby / Sinatra.

This is to demonstrate a problem we are having with Intercom Acquire integration.  When a user is signed in, and then signs out, we try to tell Intercom to shutdown and boot again, so that the chat history is cleared.  The problem is that we find that the signed in user is still present in Intercom.


Getting started
---------------

Use rbenv to install ruby version if necessary (see `.ruby-version`).

Use Bundler to install dependencies:

```sh
$ bundle install --path vendor/bundle --binstubs
```

Edit the `server.rb` file and enter a real `intercom_app_id` and `intercom_secret` (assuming you are using Intercom secure mode.)

```ruby
set :intercom_app_id, 'TODO'
set :intercom_secret, 'TODO'
```

Start webserver:

```sh
$ bundle exec foreman start
```

This should start a local webserver accessible at http://localhost:9292/.
