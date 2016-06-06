# frozen_string_literal: true
module EventCapture
  # An event logged from a client.
  class Event < ActiveRecord::Base
    before_create :set_timestamp

    serialize :payload

    private

    def set_timestamp
      self.recorded_at = Time.zone.now
    end
  end
end
