class Product < ActiveRecord::Base

	validates :default_price, :presence => true
	validates :name, :presence => true

	def self.find_by_classification(classification)
		search_condition = "%#{classification}%"
		where('classification LIKE ?', search_condition).order("id")
	end

end
