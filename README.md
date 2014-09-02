# Event Capture

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

### JS client

    var client = new EventCaptureClient('https://my.server.api');
    var response = client.log({ foo: 'bar' });
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
