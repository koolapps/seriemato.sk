$(document).bind 'page:change', ->
  Holder.run()

window.showModal = (html) ->
  $('#modal, .modal-backdrop').remove()
  $('body').append(html)
  $('#modal').modal()
