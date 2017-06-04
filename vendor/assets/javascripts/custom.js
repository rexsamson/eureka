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
    "iDisplayLength": 50
    });
  $('.dataTables_filter').addClass('pull-right');
});
//select2
$(document).ready(function() {
  placeholder: 'Select an option',
  $("select").select2({ 
      width: '100%', 
      placeholder: "Please select a country"
  });
});