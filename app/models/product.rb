class Product < ActiveRecord::Base
	
	def self.find_by_classification(classification)
		search_condition = "%#{classification}%"
		where('classification LIKE ?', search_condition).order("id")
	end

end
