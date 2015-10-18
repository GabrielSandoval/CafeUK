module AnnouncementsHelper
	def show_date_and_time(date_posted)
		"#{month_number_to_word(date_posted.month)} #{date_posted.day}, #{date_posted.year} - #{date_posted.hour}:#{format('%2d', date_posted.min)}"		
	end
end
