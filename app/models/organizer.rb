class Organizer < ActiveRecord::Base
	has_many :events
	validates_uniqueness_of :email
end
