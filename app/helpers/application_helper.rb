module ApplicationHelper
  def only_for_admin(user)
    yield if user.admin?
  end
end
