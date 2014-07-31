module ApplicationHelper
	# Returns the appropriate title
	def full_title(page_title)
		base_title = "Arkkra's Website"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
