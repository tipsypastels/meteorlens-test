module FollowersHelper
  # TODO blocked users should not be followable in either dir, etc...
  def follow_form_for(user)
    return if current_user?(user)

    if current_user.following?(user)
      unfollow_button(user.id)
    else
      follow_button(user.id)
    end
  end

  private

  def follow_button(user_id)
    content_tag(:button, t('followers.follow'),
      :class           => 'primary',
      :'data-user_id'  => user_id,
      :'data-behavior' => 'follow',
    )
  end

  def unfollow_button(user_id)
    content_tag(:button, t('followers.unfollow'),
      :'data-user_id'  => user_id,
      :'data-behavior' => 'unfollow',
    )
  end
end
