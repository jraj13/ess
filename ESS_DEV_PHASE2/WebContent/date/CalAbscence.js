
 alert("am in js=============");
$(function($) {
	 $(document).ready(function(){
 $('#datepicker1').datepicker({
 showOnFocus: false,
 /* showTrigger: '#calImg', */
 /* beforeShowDay: $.datepicker.noWeekends, */
 pickerClass: 'noPrevNext',
   numberOfMonths: 1,
       dateFormat: 'mm-dd-yy',
       /* minDate: '0', */
       maxDate: '+1Y',
             onSelect: function(dateStr) {
                   var min = $(this).datepicker('getDate');
                   $('#datepicker2').datepicker('option', 'minDate', min || '0');
                   datepicked();
       }});
	/*  }); */
	 
 $('#datepicker2').datepicker({
 showOnFocus: false,
 /* showTrigger: '#calImg', */
 /* beforeShowDay: $.datepicker.noWeekends, */
 pickerClass: 'noPrevNext',
   numberOfMonths: 1,
       dateFormat: 'mm-dd-yy',
       minDate: '0',
       maxDate: '+1Y',
             onSelect: function(dateStr) {
                   var max = $(this).datepicker('getDate');
                   $('#datepicker1').datepicker('option', 'maxDate', max || '+1Y');
                   
                   datepicked();                                               
       }});
   });
});

   var datepicked = function() {
   var datepicker1 = $('#datepicker1');
   var datepicker2 = $('#datepicker2');
   var absence = $('#absence');

var startDate = datepicker1.datepicker('getDate')
var endDate = datepicker2.datepicker('getDate')
alert("date1====="+startDate);
alert("date2====="+endDate);
//Validate input
if (endDate && startDate) {

//Calculate days between dates
var millisecondsPerDay = 86400 * 1000; // Day in milliseconds
startDate.setHours(0,0,0,1);  // Start just after midnight
endDate.setHours(23,59,59,999);  // End just before midnight
var diff = endDate - startDate;  // Milliseconds between datetime objects    
var days = Math.ceil(diff / millisecondsPerDay);

//Subtract two weekend days for every week in between
var weeks = Math.floor(days / 7);
var days = days - (weeks * 2);

//Handle special cases
var startDay = startDate.getDay();
var endDay = endDate.getDay();

//Remove weekend not previously removed.   
if (startDay - endDay > 1)         
   var days = days - 2;      

//Remove start day if span starts on Sunday but ends before Saturday
if (startDay == 0 && endDay != 6)
   var days = days - 1  

//Remove end day if span ends on Saturday but starts after Sunday
if (endDay == 6 && startDay != 0)
  var days = days - 1  
  
  var start_first = $("#datepicker1").datepicker("getDate");
  var end_first = $("#datepicker2").datepicker("getDate");
  var days_first = (end_first - start_first) / (1000 * 60 * 60 * 24)+1;
  $("#calendar").val(days_first);
  
 $("#absence").val(days);

   }
   }
 