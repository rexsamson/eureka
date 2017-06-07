//notif bootstrap autohide
$(document).ready (function(){
    $("#success-alert").hide();
    $("#success-alert").fadeTo(2000, 500).fadeIn(500, function(){
    $("#success-alert").fadeOut(500);
  });   
});
//uppercase all input
$(function() {
    $('#upper').keyup(function() {
        this.value = this.value.toUpperCase();
    });
});
//datepicker
$(document).ready(function(){
	flatpickr('#fdate');
});
//adminlte
var AdminLTEOptions = {
  enableBSToppltip: true,
  animationSpeed: 200,
  sidebarSlimScroll: true
};
//datatables
$(function () {
  $("#dttable").DataTable({
    "iDisplayLength": 50,
    "bLengthChange": false
    });
  $('.dataTables_filter').addClass('pull-right');
  
  $('#dttable2').DataTable( {

  } );
});
//select2
$(document).ready(function() {
  $("#select").select2({ 
      width: '100%', 
      allowClear: true,
      placeholder: "Please select an option"
  });
  
  $("select").select2({ 
      width: '100%', 
  });
});

//add detail
$(document).ready(function() {
 $('form').on('click', '.remove_record', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('tr').hide();
    return event.preventDefault();
  });

  $('form').on('click', '.add_fields', function(event) {
    $('.fields').append($(this).data('fields'));
    return event.preventDefault();
  });
});


