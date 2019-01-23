@closeSidebar = (cb) ->
  return console.error("Attempted to close nonexistant sidebar.") unless $('#sidebar').length
  $('body').removeClass('sidebar-open')
  cb() if typeof cb is 'function'

@openSidebar = (cb) ->
  return console.error("Attempted to open nonexistant sidebar.") unless $('#sidebar').length
  $('body').addClass('sidebar-open')
  cb() if typeof cb is 'function'

$(document).on 'turbolinks:load', ->
  $('#sidebar-wrapper').click (e) ->
    return if e.target.id isnt 'sidebar-wrapper'
    return if $('body').hasClass('sidebar-static')

    closeSidebar() 

  $('[data-behavior="open-sidebar"]').click openSidebar
  $('[data-behavior="close-sidebar"]').click closeSidebar