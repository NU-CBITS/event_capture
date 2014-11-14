module EventCapture
  # Provide event creation.
  class EventsController < ApplicationController
    def create
      @event = Event.create!(event_params)

      render json: {
        id: @event.id,
        emittedAt: @event.emitted_at,
        recordedAt: @event.recorded_at,
        payload: @event.payload,
        userId: @event.user_id,
        userAgent: @event.user_agent,
        source: @event.source,
        kind: @event.kind
      }, status: :created

    rescue ActiveRecord::ActiveRecordError => invalid
      render json: { error: model_errors(invalid.record) },
             status: :bad_request
    end

    private

    def event_params
      {
        kind: params[:kind],
        payload: params[:payload],
        emitted_at: params[:emittedAt]
      }
    end

    def model_errors(event)
      event.errors.full_messages.join(", ")
    end
  end
end
