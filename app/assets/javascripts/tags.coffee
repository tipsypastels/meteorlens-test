tagEditorOptions = 
  animateDelete: 0

$(document).on 'turbolinks:load', ->
  $('[data-taggable-field]').each ->
    if placeholder = $(this).attr('data-taggable-placeholder')
      thisOptions = Object.assign {}, tagEditorOptions, placeholder: placeholder
    else
      thisOptions = tagEditorOptions

    $(this).tagEditor(thisOptions)