followerAjaxData = ($btn) ->
  {
    user_id: $btn.attr('data-user_id')
    authenticity_token: $('meta[name=csrf-token]').attr('content')
  }

$(document).on 'turbolinks:load', ->
  $(document).on 'click', '[data-behavior="follow"]', (e) ->
    $btn = $(event.target)
    $btn.text(I18n.t('followers.unfollow'))
    $btn.removeClass('primary')
    $btn.attr('data-behavior', 'unfollow')
    
    $.ajax('/internal/follow',
      method: 'POST',
      data: followerAjaxData($btn),
    )

  $(document).on 'click', '[data-behavior="unfollow"]', (e) ->
    $btn = $(event.target)
    $btn.text(I18n.t('followers.follow'))
    $btn.addClass('primary')
    $btn.attr('data-behavior', 'follow')

    $.ajax('/internal/follow',
      method: 'DELETE',
      data: followerAjaxData($btn),
    )