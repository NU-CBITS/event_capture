require "jbuilder"

module EventCapture
  # Manage events.
  class EventsController < ApplicationController
    def create
      @event = Event.create!(event_params)

      render "event_capture/events/create", status: :created

    rescue ActiveRecord::ActiveRecordError => invalid
      render json: { error: model_errors(invalid.record) },
             status: :bad_request
    end

    private

    def event_params
      {
        payload: params[:payload],
        emitted_at: params[:emittedAt]
      }
    end

    def model_errors(event)
      event.errors.full_messages.join(", ")
    end
  end
end
