


//lipp text box validation
function islipp(evt) { 
      var charCode = (evt.charCode) ? evt.which : event.keyCode


      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
          return false; 
      else { 
      var input = document.getElementById("lipp1").value;
          var len = document.getElementById("lipp1").value.length; 
          var index = document.getElementById("lipp1").value.indexOf('.'); 

          if (index > 0 && charCode == 46) { 
              return false; 
          } 
          if (index >0 || index==0) { 
              var CharAfterdot = (len + 1) - index; 
              if (CharAfterdot > 2) { 

                  return false; 
              } 

     }

 if (charCode == 46 && input.split('.').length >1) {
     return false;
     }


      } 
      return true; 
   } 

//ppf text box validation

function isppf(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("ppf1").value;
        var len = document.getElementById("ppf1").value.length; 
        var index = document.getElementById("ppf1").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 

   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }


    } 
    return true; 
 } 

//nss text box validation

function isnss(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("nss1").value;
	          var len = document.getElementById("nss1").value.length; 
	          var index = document.getElementById("nss1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 

//nsc text box validation

function isnsc(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("nsc1").value;
	          var len = document.getElementById("nsc1").value.length; 
	          var index = document.getElementById("nsc1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 

//cgb text box validation

function iscgb(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("cgb1").value;
	          var len = document.getElementById("cgb1").value.length; 
	          var index = document.getElementById("cgb1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 

//lap text box validation

function islap(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("lap1").value;
	          var len = document.getElementById("lap1").value.length; 
	          var index = document.getElementById("lap1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 

//elss text box validation

function iselss(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("elss1").value;
	          var len = document.getElementById("elss1").value.length; 
	          var index = document.getElementById("elss1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 
//npf text box validation

function isnpf(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("npf1").value;
	          var len = document.getElementById("npf1").value.length; 
	          var index = document.getElementById("npf1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 

//db text box validation
function isdb(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("db1").value;
	          var len = document.getElementById("db1").value.length; 
	          var index = document.getElementById("db1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 
//hlr text box validation

function ishlr(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("hlr1").value;
	          var len = document.getElementById("hlr1").value.length; 
	          var index = document.getElementById("hlr1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }

	      } 
	      return true; 
	   } 



//ies text box validation


function isies(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("ies1").value;
	          var len = document.getElementById("ies1").value.length; 
	          var index = document.getElementById("ies1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 

//imf text box validation

function isimf(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("imf1").value;
	          var len = document.getElementById("imf1").value.length; 
	          var index = document.getElementById("imf1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 

// tfc text box validation

function istfc(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("tfc1").value;
	          var len = document.getElementById("tfc1").value.length; 
	          var index = document.getElementById("tfc1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 


//jeevan text box validation
function isjeevan(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("jsp1").value;
	          var len = document.getElementById("jsp1").value.length; 
	          var index = document.getElementById("jsp1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 


//mpn text box validation

function ismpn(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("mpn1").value;
	          var len = document.getElementById("mpn1").value.length; 
	          var index = document.getElementById("mpn1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 

//mps text box validation

function ismps(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("mps1").value;
	          var len = document.getElementById("mps1").value.length; 
	          var index = document.getElementById("mps1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 

//ms text box validation


function isms(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("ms1").value;
	          var len = document.getElementById("ms1").value.length; 
	          var index = document.getElementById("ms1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 

//mth text box validation

function ismth(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("mth1").value;
	          var len = document.getElementById("mth1").value.length; 
	          var index = document.getElementById("mth1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 
//mts validation



function ismts(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("mts1").value;
	          var len = document.getElementById("mts1").value.length; 
	          var index = document.getElementById("mts1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 

// mtsc validation 

function ismtsc(evt) { 
	      var charCode = (evt.charCode) ? evt.which : event.keyCode


	      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
	          return false; 
	      else { 
	      var input = document.getElementById("mtsc1").value;
	          var len = document.getElementById("mtsc1").value.length; 
	          var index = document.getElementById("mtsc1").value.indexOf('.'); 

	          if (index > 0 && charCode == 46) { 
	              return false; 
	          } 
	          if (index >0 || index==0) { 
	              var CharAfterdot = (len + 1) - index; 
	              if (CharAfterdot > 2) { 

	                  return false; 
	              } 

	     }

	 if (charCode == 46 && input.split('.').length >1) {
	     return false;
	     }


	      } 
	      return true; 
	   } 











