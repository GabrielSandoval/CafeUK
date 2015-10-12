class Reservation < ActiveRecord::Base
	belongs_to :user, :foreign_key => :user_id

	# validates :date, :presence => true
	# validates :time, :presence => true
	# validates :table_number, :presence => true

end
