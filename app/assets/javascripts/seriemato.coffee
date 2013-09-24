$(document).bind 'page:change', ->
  Holder.run()

window.show_modal = (html) ->
  $('#modal, .modal-backdrop').remove()
  $('body').append(html)
  $('#modal').modal()
