module EventCapture
  # An event logged from a client.
  class Event < ActiveRecord::Base
    before_create :set_timestamp

    serialize :payload

    private

    def set_timestamp
      self.recorded_at = DateTime.now
    end
  end
end
