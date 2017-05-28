//Disable if copy save, else paste
document.onkeydown = function(e) {
event = (event || window.event);
    if (event.keyCode == 123) {
        return false;
    }
    if (e.ctrlKey && 
        (e.keyCode === 85 || 
         e.keyCode === 83 ||
         e.keyCode === 87 ||
         e.keyCode === 117)) {
        /* alert('not allowed'); */
        return false;
    } else {
        return true;
    }
};
//Disable image right click
document.oncontextmenu = function(e){
	var target = (typeof e !="undefined")? e.target: event.srcElement
	if (target.tagName == "IMG" || (target.tagName == 'A' && target.firstChild.tagName == 'IMG'))
		return false
}
//Disable right click
var message="Function Disabled!";
function clickIE4(){
	if (event.button==2){
		return false;
	}
}
function clickNS4(e){
	if (document.layers||document.getElementById&&!document.all){
		if (e.which==2||e.which==3){
		return false;
		}
	}
}
if (document.layers){
	document.captureEvents(Event.MOUSEDOWN);
	document.onmousedown=clickNS4;
}
else if (document.all&&!document.getElementById){
	document.onmousedown=clickIE4;
}
document.oncontextmenu=new Function("return false")
