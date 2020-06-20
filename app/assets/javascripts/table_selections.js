$(document).ready(function() {
  
  var table = $('#table_selections').DataTable( {
      responsive: true
    } )
    .columns.adjust()
    .responsive.recalc();
} )