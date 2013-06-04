class AddHereToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :here, :bool, default: false
  end
end
