class Attendee < ActiveRecord::Base
  attr_accessible :name, :here
  belongs_to :group
end
