// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  var table = $('#locations').dataTable({
  	order: [[ 0, 'desc' ]],
    bServerSide: true,
    sAjaxSource: $('#locations').data('source')
  });

  setInterval( function () {table.api().ajax.reload();}, 1000);
});
