$(document).ready(function() {
  
  var table = $('#table_coins').DataTable( {
      responsive: true
    } )
    .columns.adjust()
    .responsive.recalc();
} )