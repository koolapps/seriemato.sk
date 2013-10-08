window.showModal = (html) ->
  $('#modal, .modal-backdrop').remove()
  $('body').append(html)
  $('#modal').modal()
