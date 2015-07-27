class ChangeEventsEmittedAtToNull < ActiveRecord::Migration
  def change
    change_column_null :event_capture_events, :emitted_at, false
  end
end
