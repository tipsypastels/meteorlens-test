module UsersHelper
  def link_to_current_user(text = nil)
    link_to text || current_user.username, current_user
  end
end
