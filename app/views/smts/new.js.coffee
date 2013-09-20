$('#modal, .modal-backdrop').remove()
$('body').append('<%=j render('modal') %>')
$('#modal').modal()
