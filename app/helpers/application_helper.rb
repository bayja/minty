module ApplicationHelper
	def background_url_for_user(user)
		# "/design_image/#{user.id}"
		url_for(controller: 'design_image', action: 'show', id: user.id)
	end
end
