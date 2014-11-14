# Event Capture

[![Build Status](https://travis-ci.org/cbitstech/event_capture.svg?branch=master)](https://travis-ci.org/cbitstech/event_capture) [![security](https://hakiri.io/github/cbitstech/event_capture/master.svg)](https://hakiri.io/github/cbitstech/event_capture/master)

Server and client components for capturing events.

## Dependencies/assumptions

The JS client bundled with this engine assumes that jQuery is present.
Due to the use of some methods, such as `Date.prototype.toISOString`, the JS
client is not compatible with older browsers such as IE8.

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

If you want to add controller filters, such as for authentication, you can do
so in an initializer. E.g. in `config/initializers/event_capture.rb`

    require "event_capture/events_controller"

    class EventCapture::EventsController
      before_action :authenticate_participant!
    end

Additionally, you can add additional parameters to an event in the controller.

    class EventCapture::EventsController

      ...

      def event_params
        {
          payload: params[:payload],
          emitted_at: params[:emittedAt],
          participant_id: current_participant.id
        }
      end
    end

### JS client

Load the JavaScript in your manifest

    //= require event_capture

Use the client to emit data and handle server responses

    var client = new EventCaptureClient('https://my.server.api');
    var response = client.log({ kind: 'myEvent', payload: { foo: 'bar' } });
    response.done(function(event) {
      ...
    });
    response.fail(function(xhr, status, error) {
      ...
    });

## Run Ruby specs

Create the database

    rake app:db:create app:db:migrate

Run the specs

    rake spec

## Run rubocop linter

    rake rubocop

## Run jsHint linter

    rake jshint
