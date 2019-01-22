module UsersHelper
  def link_to_current_user(text = nil)
    link_to text || current_user.username, current_user
  end

  def avatar_for(user, size: 'md', **opts)
    klass = "avatar avatar-#{size} #{opts.delete(:class)}"
    
    if user.avatar?
      image_tag user.avatar, class: klass, **opts
    else
      letter = user.initial
      content_tag :div, letter, class: klass, **opts
    end
  end
end
