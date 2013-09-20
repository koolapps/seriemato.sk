$('#modal').remove()
$('body').append('<%=j render('modal') %>')
$('#modal').modal()
