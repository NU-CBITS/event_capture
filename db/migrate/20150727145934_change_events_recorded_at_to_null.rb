class ChangeEventsRecordedAtToNull < ActiveRecord::Migration
  def change
    change_column_null :event_capture_events, :recorded_at, false
  end
end
