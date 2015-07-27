module EventCapture
  # An event logged from a client.
  class Event < ActiveRecord::Base
    before_create :set_timestamps

    serialize :payload

    private

    def set_timestamps
      self.emitted_at = DateTime.now
      self.recorded_at = DateTime.now
    end
  end
end
