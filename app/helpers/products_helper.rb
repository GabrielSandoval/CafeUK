module ProductsHelper

	def menu_thumbnail_photo(classification)
		image_tag "#{classification}s.jpg", :class=>"img img-responsive"
	end

end
