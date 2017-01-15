$(document).ready(function() {
    var table = $('#table').DataTable();
 
    $('#table tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected');
    } );
 
    $('#but').click( function () {
console.log( table.rows('.selected').data().toString() +' row(s) selected' );
console.dirxml();
    } );
} );
