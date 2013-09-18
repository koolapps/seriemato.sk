$('.smt-count').html('<%= @smt.issue.smt_count %>')
$('body').append('<%=j render('modal') %>')
$('#modal').modal()
