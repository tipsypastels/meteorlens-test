@flash = (key, value) ->
  $node = $("""
    <div class="flash flash-#{key}">
      <i class="fas fa-#{flashIcons[key]}"></i>

      <span class="flash-content">
        #{value}
      </span>
    </div>
  """)

  $('#flash-wrapper').prepend $node
  dismissLater($node, flashDismissSeconds)

dismissLater = ($node, seconds) ->
  setTimeout ->
    $node.remove()
  , seconds * 1000

$(document).on 'turbolinks:load', ->
  $('[data-dismiss-in]').each ->
    $node = $(this)
    seconds = $node.attr('data-dismiss-in')
    dismissLater($node, seconds)