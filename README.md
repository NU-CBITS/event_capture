# Event Capture

Server and client components for capturing events.

## Installation

Add to your `Gemfile`

    gem 'event_capture', git: 'git@github.com:cbitstech/event_capture.git'

Then

    bundle install

Add the migrations

    rake event_capture:install:migrations

And run them

    rake db:migrate

## Usage

Mount the engine in `config/routes.rb`

    mount EventCapture::Engine, at: "event_capture"

## Run Ruby specs

Create the database

    rake app:db:create app:db:migrate

Run the specs

    rake spec
