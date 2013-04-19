module ApplicationHelper

	def background_url_for_user(user)
		# "/design_image/#{user.id}"
		url_for(controller: 'design_image', action: 'show', id: user.id)
	end

  def only_for_admin(user)
    yield if user.admin?
  end

end
