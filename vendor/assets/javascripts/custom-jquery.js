//notif bootstrap autohide
$(document).ready (function(){
    $("#success-alert").hide();
    $("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});   
        
});
//Disable zoom
$(document).keydown(function(event) {
	if (event.ctrlKey==true && (event.which == '61' || event.which == '107' || event.which == '173' || event.which == '109'  || event.which == '187'  || event.which == '189'  ) ) {
		event.preventDefault();
	}
	// 107 Num Key  +
	// 109 Num Key  -
	// 173 Min Key  hyphen/underscor Hey
	// 61 Plus key  +/= key
});
$(window).bind('mousewheel DOMMouseScroll', function (event) {
	if (event.ctrlKey == true) {
		event.preventDefault();
	}
});
//datepicker
$(document).ready(function(){
	flatpickr('#fdate');
});