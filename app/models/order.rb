class Order < ActiveRecord::Base
	has_many :cakes, :dependent => :destroy
	has_many :drinks, :dependent => :destroy
	has_many :paninis, :dependent => :destroy
	# has_many :pasta, :dependent => :destroy
	has_many :salads, :dependent => :destroy

end
