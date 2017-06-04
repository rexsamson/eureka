//notif bootstrap autohide
$(document).ready (function(){
    $("#success-alert").hide();
    $("#success-alert").fadeTo(2000, 500).fadeIn(500, function(){
    $("#success-alert").fadeOut(500);
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

$(function () {
  $("#dttable, #dttable2").DataTable({
    "iDisplayLength": 50
    });
  $('.dataTables_filter').addClass('pull-right');
  
});
