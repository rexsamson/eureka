//notif bootstrap autohide
$(document).ready (function(){
    $("#success-alert").hide();
    $("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
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
	flatpickr('.fdate');
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
    "iDisplayLength": 25,
    "bLengthChange": false,
    "bSort" : true,
    "bInfo" : false,
    drawCallback: function(settings) {
    var pagination = $(this).closest('.dataTables_wrapper').find('.dataTables_paginate');
    pagination.toggle(this.api().page.info().pages > 1);
    }
  });
  $('.dataTables_filter').addClass('pull-right');
  
  $('#dttablefull').DataTable( {

  } );
});

//select2
$(document).ready(function() {
  $("#select").select2({ 
      width: '100%', 
      allowClear: true,
      placeholder: "--Select--"
  });
  $("select").select2({ 
      width: '100%', 
      placeholder: "--Select--"
  });
  
});

//add and remove detail
$(document).ready(function() {
 $('form').on('click', '.remove_record', function(event) {
      $(this).prev('input[type=hidden]').val('1');
      $(this).closest('tr').hide();
      return event.preventDefault();
  });
  $('form').on('click', '.add_fields', function(event) {
    $('.fields').append($(this).data('fields'));
    flatpickr('.fdate');
    return event.preventDefault();
  });
});

/*
//Ajax Load Container Contents
$(document).ready(function(){
	$("a[rel='tab']").click(function(e){
		e.preventDefault();
		$("#content").load($(this).attr('href'));
	});
});
//current page ajax
$(document).ready(function() {
    $('#menu li').click(function(){
        $('#menu li').each(function(){
            $(this).removeClass('active'); 
        });
        $(this).addClass('active');
    });
});*/

