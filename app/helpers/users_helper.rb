module UsersHelper
  def image_thumb_tag(user)
    "<img src='#{user.profile_thumb_image}' style='width: 100px; height: 100px'>"
  end

  def user_thumb_image(user)
    [user.profile_thumb_image, {style: "width: 100px; height: 100px"}]
  end
end
