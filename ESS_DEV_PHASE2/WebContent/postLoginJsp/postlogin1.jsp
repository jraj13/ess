
<%
	String uName = (String) session.getAttribute("loginid");
	String rolename = (String) session.getAttribute("rolesession");
	
	String design_session = (String) session.getAttribute("design_session");
	/*  String uName="yogesh"; */
	//uName = "YOGESH@CLOCKSOFT.INFO";
	//uName = "MANGR";
	//uName = "HR";
	//uName = "HRMANGR";

	/*  	if (uName != null) {  */
%>

<%-- <%
	session = request.getSession();
	System.out.println("in login controller page &&&&&&&&&&&:1111:"+session.getId());
	session.invalidate();
	//if(session == null || session.getAttribute("rgoldsessionid") == null)
	session = request.getSession(true);
	%> 
 --%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="com.ess.common.action.EmployeeDetailsPersonal"%>
    <%@ page import="com.ess.common.eseparation.WorkSheet_FandF" %>
<!DOCTYPE html>
<html lang="en">
<head>

<%-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css"> --%>

<link rel="stylesheet" href="postloginresource/jquery-ui.css">
<script src="postloginresource/jquery-1.10.2.js"></script>
<script src="postloginresource/jquery-ui.js"></script>


<script>
history.forword();
</script>

<%-- <style>
.nav_clicked {
background-color:blue;
}
</style> --%>

<script type="text/javascript">
    function changeColor(id) {
        var tabs = document.getElementsByClassName('tab')
        for (var i = 0; i < tabs.length; ++i) {
            var item = tabs[i];
            item.style.backgroundColor = (item.id == id) ? "#63A2CF" : "#DB0404";
        }
    }
</script>


<meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
          <meta http-equiv="Expires" content="-1"/>
          
          
             
<script type="text/javascript">
function loadPage(url, dataString) {
$('#content').html('<img src="images/loading.gif">');
		$.ajax({
			url : url,
			timeout: 30000,
			type : 'POST',
			data : dataString,
			datatype : 'json',
			success : function(data) {
				$('#content').html(data)
			},
			error : function(jqXHR, textStatus, errorThrown) {
				$('#content').html('No data found');
			}
		});

	}
function qryPage(url, dataString) {

	$('#qrySuccess').html('<img src="images/loading.gif">');
	$.ajax({
		url : url,
		timeout: 30000,
		type : 'POST',
		data : dataString,
		datatype : 'json',
		success : function(data) {
			$('#qrySuccess').html(data)
		},
		error : function(jqXHR, textStatus, errorThrown) {
			$('#qrySuccess').html('No data found');
		}
	});

}


function atndQryRslt(id) {

	//alert("Am In Btn Click");

	$('#qryload').html('<img src="images/loading.gif" >');
	$.ajax({
		url : 'url',
		timeout: 30000,
		type : 'POST',
		data : dataString,
		datatype : 'json',
		success : function(data) {

			$('#qryload').html(data)

		},
		error : function(jqXHR, textStatus, errorThrown) {
			$('#qryload').html('No data found');
		}
	});

}


	$(function() {	
		
 var uName='<%=uName%>';
 var rolename='<%=rolename%>';
 var desigsession='<%=design_session%>';

		//alert("Wrking==" + uName); 
		//alert("Wrking==" + rolename); 

		if (rolename == "MANAGER") {

			$('#ess').show();
			$('#ld').show();
			$('#mss').hide();
			$('#ms').show();
			$('#hrd').hide();
			
			$('#wiw').hide();
			$('#abtatndlv').hide();
			$('#abtatregu').hide();
			$('#e-sep_man_post').hide();
			$('#e-sep_hr_tab').hide();
			$('#cnj').hide();
			$('#epms').hide();
			$('#esep').hide();
			$('#hrpd').hide();
			$('#dueclarance_test').hide();
			$('#hrctrl').hide();
			$('#adctrl').hide();
			$('#sad').hide();
			$('#e-sep_sa_tab').hide();
			$('#accdash').hide();
			//$('#it_support_team_tab').hide();
			$('#e-sep_acc_tab').hide();
			$('#admindash').hide();
			$('#hdesk_query').hide();
			 /* $("#ms").click(function() {
				
				$('#wid').show();
				$('#abtatndlv').show();
				$('#ms').show();
				$('#ess').show();
				$('#ld').show();
				$('#mss').hide();
				$('#cnj').hide();
				$('#epms').hide();
				$('#esep').hide();
				$('#hrpd').hide();
				$('#hrd').hide();
				$('#hrctrl').hide();
				$('#adctrl').hide();
				
				$('#sidebar').load('postLoginJsp/PI/personalinfo_menu1.jsp');
				loadPage('postLoginJsp/PI/personalProfile.jsp', '');
				
			})  */

		} 
		else if (rolename == "HR") {

			$('#hrd').show();
			$('#cnj').hide();
			$('#epms').hide();
			$('#esep').hide();
			$('#hrpd').hide();
			$('#dueclarance_test').hide();
			$('#ess').show();
			$('#elc').show();
			$('#mss').hide();
			$('#ms').hide();
			$('#hrctrl').hide();
			
			$('#adctrl').hide();
			$('#wiw').hide();
			$('#abtatndlv').hide();
			$('#abtatregu').hide();
			$('#e-sep_man_post').hide();
			$('#e-sep_hr_tab').hide();
			$('#sad').hide();
			//$('#it_support_team_tab').hide();
			$('#e-sep_sa_tab').hide();
			$('#accdash').hide();
			$('#e-sep_acc_tab').hide();
			$('#admindash').hide();
			$('#hdesk_query').hide();

			$("#ess").click(function() {

				$('#info').show();
				$('#atnd').show();
				$('#ffs').show();
				$('#reimb').show();
				$('#bpay').show();
				$('#tmgmt').show();
				$('#wtsn').show();
				$('#whoswho').show();
				$('#eoff').show();
				$('#ins').show();
				$('#rbfs').show();
				$('#hdesk').show();
				
				$('#wiw').hide();
				$('#abtatndlv').hide();
				$('#abtatregu').hide();
				$('#e-sep_man_post').hide();
				$('#cnj').hide();
				$('#epms').hide();
				$('#esep').hide();
				$('#hrpd').hide();
				$('#dueclarance_test').hide();
				$('#hrctrl').hide();
				$('#adctrl').hide();
				$('#e-sep_hr_tab').hide();
				$('#e-sep_sa_tab').hide();
				$('#e-sep_acc_tab').hide();
				$('#sad').hide();
				$('#hdesk_query').hide();
				
				$('#sidebar').load('postLoginJsp/PI/personalinfo_menu1.jsp');
				loadPage('postLoginJsp/PI/personalProfile.jsp', '');

			})
		} 
		
		else if (rolename == "ADMIN") {
			
		
			$('#admindash').show();
			$('#hrd').show();
			$('#cnj').hide();
			$('#epms').hide();
			$('#esep').hide();
			$('#hrpd').hide();
			$('#dueclarance_test').hide();
			$('#ess').show();
			$('#elc').show();
			$('#mss').hide();
			$('#ms').hide();
			$('#hrctrl').hide();
			$('#adctrl').show();
			$('#wiw').hide();
			$('#abtatndlv').hide();
			$('#abtatregu').hide();
			$('#e-sep_man_post').hide();
			$('#e-sep_hr_tab').hide();
			$('#sad').hide();
			$('#accdash').hide();
		//	$('#it_support_team_tab').hide();
			$('#e-sep_sa_tab').hide();
			$('#e-sep_acc_tab').hide();
			$('#hdesk_query').hide();
			
			$("#ess").click(function() {

				$('#info').show();
				$('#atnd').show();
				$('#ffs').show();
				$('#reimb').show();
				$('#bpay').show();
				$('#tmgmt').show();
				$('#wtsn').show();
				$('#whoswho').show();
				$('#eoff').show();
				$('#ins').show();
				$('#rbfs').show();
				$('#hdesk').show();
				
				$('#wid').hide();
				$('#abtatndlv').hide();
				$('#abtatregu').hide();
				$('#e-sep_man_post').hide();
				$('#cnj').hide();
				$('#epms').hide();
				$('#esep').hide();
				$('#hrpd').hide();
				$('#dueclarance_test').hide();
				$('#hrctrl').show();
				$('#adctrl').show();
				$('#e-sep_hr_tab').hide();
				$('#e-sep_sa_tab').hide();
				$('#e-sep_acc_tab').hide();
				$('#sad').hide();
				$('#accdash').hide();
				$('#hdesk').show();
				
				$('#sidebar').load('postLoginJsp/PI/personalinfo_menu1.jsp');
				loadPage('postLoginJsp/PI/personalProfile.jsp', '');
			})

		} 
		/* else if (rolename == "IT SUPPORT TEAM") {

			$('#it_support_team_tab').show();
			$('#cnj').hide();
			$('#epms').hide();
			$('#esep').hide();
			$('#hrpd').hide();
			$('#dueclarance_test').hide();
			$('#ess').show();
			$('#elc').show();
			$('#mss').hide();
			$('#ms').hide();
			$('#hrd').hide();
			$('#hrctrl').hide();
			$('#adctrl').hide();
			$('#wiw').hide();
			$('#abtatndlv').hide();
			$('#abtatregu').hide();
			$('#e-sep_man_post').hide();
			$('#e-sep_hr_tab').hide();
		} */
		
		else if (rolename == "SANCTIONING AUTHORITY") {

			$('#sad').show();
			$('#hrd').hide();
			$('#cnj').hide();
			$('#epms').hide();
			$('#esep').hide();
			$('#hrpd').hide();
			$('#dueclarance_test').hide();
			$('#ess').show();
			$('#elc').show();
			$('#mss').hide();
			$('#ms').hide();
			$('#hrctrl').hide();
			
			$('#adctrl').hide();
			$('#wiw').hide();
			$('#abtatndlv').hide();
			$('#abtatregu').hide();
			$('#e-sep_man_post').hide();
			$('#e-sep_hr_tab').hide();
			$('#e-sep_sa_tab').hide();
			$('#e-sep_acc_tab').hide();
			//$('#it_support_team_tab').hide();
			$('#accdash').hide();
			$('#admindash').hide();

			$("#ess").click(function() {

				$('#info').show();
				$('#atnd').show();
				$('#ffs').show();
				$('#reimb').show();
				$('#bpay').show();
				$('#tmgmt').show();
				$('#wtsn').show();
				$('#whoswho').show();
				$('#eoff').show();
				$('#ins').show();
				$('#rbfs').show();
				$('#hdesk').show();
				
				$('#wiw').hide();
				$('#abtatndlv').hide();
				$('#abtatregu').hide();
				$('#e-sep_man_post').hide();
				$('#cnj').hide();
				$('#epms').hide();
				$('#esep').hide();
				$('#hrpd').hide();
				$('#dueclarance_test').hide();
				$('#hrctrl').hide();
				$('#adctrl').hide();
				$('#e-sep_hr_tab').hide();
				$('#e-sep_sa_tab').hide();
				$('#hdesk_query').hide();
				$('#hdesk').show();
				
				$('#sidebar').load('postLoginJsp/PI/personalinfo_menu1.jsp');
				loadPage('postLoginJsp/PI/personalProfile.jsp', '');

			})
			
			
		} 
		
		
	else if (rolename == "ACCOUNTANT") {
		    
			$('#accdash').show();
			$('#hrd').hide();
			$('#cnj').hide();
			$('#epms').hide();
			$('#esep').hide();
			$('#hrpd').hide();
			$('#dueclarance_test').hide();
			$('#ess').show();
			$('#elc').show();
			$('#mss').hide();
			$('#ms').hide();
			$('#hrctrl').hide();
			
			$('#adctrl').hide();
			$('#wiw').hide();
			$('#abtatndlv').hide();
			$('#abtatregu').hide();
			$('#e-sep_man_post').hide();
			$('#e-sep_hr_tab').hide();
			$('#e-sep_sa_tab').hide();
			//$('#it_support_team_tab').hide();
			$('#e-sep_acc_tab').hide();
			$('#sad').hide();
			$('#admindash').hide();

			$("#ess").click(function() {

				$('#info').show();
				$('#atnd').show();
				$('#ffs').show();
				$('#reimb').show();
				$('#bpay').show();
				$('#tmgmt').show();
				$('#wtsn').show();
				$('#whoswho').show();
				$('#eoff').show();
				$('#ins').show();
				$('#rbfs').show();
				$('#hdesk').show();
				
				$('#wiw').hide();
				$('#abtatndlv').hide();
				$('#abtatregu').hide();
				$('#e-sep_man_post').hide();
				$('#cnj').hide();
				$('#epms').hide();
				$('#esep').hide();
				$('#hrpd').hide();
				$('#dueclarance_test').hide();
				$('#hrctrl').hide();
				$('#adctrl').hide();
				$('#e-sep_hr_tab').hide();
				$('#e-sep_sa_tab').hide();
				$('#e-sep_acc_tab').hide();
				$('#sad').hide();
				$('#hdesk_query').hide();
				$('#hdesk').show();
				
				$('#sidebar').load('postLoginJsp/PI/personalinfo_menu1.jsp');
				loadPage('postLoginJsp/PI/personalProfile.jsp', '');

			})
			
			
		} 

/*  else if(rolename == "EMPLOYEE" && EMP_DESIG=="IT ASSET"){
		alert("support");
		$('#cnj').hide();
		$('#epms').hide();
		$('#esep').hide();
		$('#hrpd').hide();
		$('#dueclarance_test').hide();
		$('#ess').show();
		$('#elc').show();
		$('#mss').hide();
		$('#ms').hide();
		$('#hrd').hide();
		$('#hrctrl').hide();
		$('#adctrl').hide();
		$('#wiw').hide();
		$('#abtatndlv').hide();
		$('#abtatregu').hide();
		$('#e-sep_man_post').hide();
		$('#e-sep_hr_tab').hide();
		//$('#it_support_team_tab').hide();
		$('#sad').hide();
		$('#e-sep_sa_tab').hide();
		$('#accdash').hide();
		$('#e-sep_acc_tab').hide();
		$('#admindash').hide();
		$('#hdesk_query').show();
		
		} 
 */
		
		else {
		//	 alert(desigsession);
			
			 if(desigsession=="IT ASSET"){

				 $('#cnj').hide();
				$('#epms').hide();
				$('#esep').hide();
				$('#hrpd').hide();
				$('#dueclarance_test').hide();
				$('#ess').show();
				$('#elc').show();
				$('#mss').hide();
				$('#ms').hide();
				$('#hrd').hide();
				$('#hrctrl').hide();
				$('#adctrl').hide();
				$('#wiw').hide();
				$('#abtatndlv').hide();
				$('#abtatregu').hide();
				$('#e-sep_man_post').hide();
				$('#e-sep_hr_tab').hide();
				//$('#it_support_team_tab').hide();
				$('#sad').hide();
				$('#e-sep_sa_tab').hide();
				$('#accdash').hide();
				$('#e-sep_acc_tab').hide();
				$('#admindash').hide();
				$('#hdesk_query').show();
				$('#hdesk').show();
				
				 $("#ess").click(function() {

						$('#info').show();
						$('#atnd').show();
						$('#ffs').show();
						$('#reimb').show();
						$('#bpay').show();
						$('#tmgmt').show();
						$('#wtsn').show();
						$('#whoswho').show();
						$('#eoff').show();
						$('#ins').show();
						$('#rbfs').show();
						$('#hdesk').show();
						$('#hdesk_query').show();
						
						$('#wiw').hide();
						$('#abtatndlv').hide();
						$('#abtatregu').hide();
						$('#e-sep_man_post').hide();
						$('#cnj').hide();
						$('#epms').hide();
						$('#esep').hide();
						$('#hrpd').hide();
						$('#dueclarance_test').hide();
						$('#hrctrl').hide();
						$('#adctrl').hide();
						$('#e-sep_hr_tab').hide();
						$('#e-sep_sa_tab').hide();
						$('#e-sep_acc_tab').hide();
						$('#sad').hide();
						
						
						$('#sidebar').load('postLoginJsp/PI/personalinfo_menu1.jsp');
						loadPage('postLoginJsp/PI/personalProfile.jsp', '');

					})
				
				}
			else{
				
				
			$('#cnj').hide();
			$('#epms').hide();
			$('#esep').hide();
			$('#hrpd').hide();
			$('#dueclarance_test').hide();
			$('#ess').show();
			$('#elc').show();
			$('#mss').hide();
			$('#ms').hide();
			$('#hrd').hide();
			$('#hrctrl').hide();
			$('#adctrl').hide();
			$('#wiw').hide();
			$('#abtatndlv').hide();
			$('#abtatregu').hide();
			$('#e-sep_man_post').hide();
			$('#e-sep_hr_tab').hide();
			//$('#it_support_team_tab').hide();
			$('#sad').hide();
			$('#e-sep_sa_tab').hide();
			$('#accdash').hide();
			$('#e-sep_acc_tab').hide();
			$('#admindash').hide();
			$('#hdesk_query').hide();
			$('#hdesk').show();
			
			 $("#ess").click(function() {

					$('#info').show();
					$('#atnd').show();
					$('#ffs').show();
					$('#reimb').show();
					$('#bpay').show();
					$('#tmgmt').show();
					$('#wtsn').show();
					$('#whoswho').show();
					$('#eoff').show();
					$('#ins').show();
					$('#rbfs').show();
					$('#hdesk').hide();
					
					$('#wiw').hide();
					$('#abtatndlv').hide();
					$('#abtatregu').hide();
					$('#e-sep_man_post').hide();
					$('#cnj').hide();
					$('#epms').hide();
					$('#esep').hide();
					$('#hrpd').hide();
					$('#dueclarance_test').hide();
					$('#hrctrl').hide();
					$('#adctrl').hide();
					$('#e-sep_hr_tab').hide();
					$('#e-sep_sa_tab').hide();
					$('#e-sep_acc_tab').hide();
					$('#sad').hide();
					$('#hdesk_query').hide();
					
					
					$('#sidebar').load('postLoginJsp/PI/personalinfo_menu1.jsp');
					loadPage('postLoginJsp/PI/personalProfile.jsp', '');

				})
				
			 } 
			
		}
		
	
		// what's new
		$("#wtsn").click(function() {
			$('#sidebar').load('postLoginJsp/PI/whatsnew_menu.jsp');
			loadPage('postLoginJsp/PI/whatnew.jsp', '');

		})
		
		// who's who
		
		$("#whoswho").click(function() {
			$('#sidebar').load('postLoginJsp/WHOSWHO/whoswho_menu.jsp');
			loadPage('postLoginJsp/WHOSWHO/employee_search.jsp', '');

		})
		
		
		$("#info").click(function() {
			//	alert("Am frm Info");

			$('#sidebar').load('postLoginJsp/PI/personalinfo_menu1.jsp');
			loadPage('postLoginJsp/PI/personalProfile.jsp', '');
			//loadPage('postLoginJsp/PI/personalinfo_menu1.jsp', '');

		})
		
		$("#atnd").click(function() {
		//			alert("Am frm atnd");
			$('#sidebar').load('postLoginJsp/ATND/atnd_menu.jsp');
			loadPage('postLoginJsp/ATND/worktime.jsp', '');
			//loadPage('postLoginJsp/PI/personalinfo_menu1.jsp', '');

		})
		
		//employee self service
		$("#ess").click(function() {

			$('#info').show();
			$('#atnd').show();
			$('#ffs').show();
			$('#reimb').show();
			$('#bpay').show();
			$('#tmgmt').show();
			$('#wtsn').show();
			$('#eoff').show();
			$('#ins').show();
			$('#rbfs').show();
			$('#whoswho').show();
			$('#hdesk').show();
			
			
			$('#dueclarance_test').hide();
			$('#cnj').hide();
			$('#epms').hide();
			$('#esep').hide();
			$('#hrpd').hide();
			$('#wiw').hide();
			$('#abtatndlv').hide();
			$('#abtatregu').hide();
			$('#e-sep_man_post').hide();
			$('#e-sep_hr_tab').hide();
			$('#hrctrl').hide();
			$('#e-sep_sa_tab').hide();
			$('#e-sep_acc_tab').hide();
			
			
			$('#sidebar').load('postLoginJsp/PI/personalinfo_menu1.jsp');
			loadPage('postLoginJsp/PI/personalProfile.jsp', '');

		})
		
		//learnig and Development
		$("#ld").click(function() {
			
		/*	$('#mss').hide();	 
			$('#cnj').hide();
			$('#epms').hide();
			$('#esep').hide();
			$('#hrpd').hide();
			$('#info').hide();
			$('#atnd').hide();
			$('#ffs').hide();
			$('#reimb').hide();
			$('#bpay').hide();
			$('#tmgmt').hide();
			$('#wtsn').hide();
			$('#eoff').hide();
			$('#ins').hide();
			$('#rbfs').hide();
			$('#hrctrl').hide();
			$('#adctrl').hide();
			$('#wiw').hide();
			$('#abtatndlv').hide();
			$('#abtatregu').hide();
			$('#e-sep_man_post').hide();
			$('#whoswho').hide();
			$('#e-sep_hr_tab').hide();
			$('#dueclarance_test').hide();
			
			$('#e-sep_sa_tab').hide(); 
			$('#hdesk').hide();
			$('#hdesk_query').hide();
			*/
			
			/* $('#sidebar').load('postLoginJsp/PI/sideMenu.jsp');*/
			$('#sidebar').load('postLoginJsp/PI/employeeoffer_menu.jsp');
			loadPage('postLoginJsp/PI/learning_development.jsp', '');
		})
		
		
		//manager self services
		
		$("#ms").click(function() {
				//alert("you are not a manager!!!if any query contact to ADMIN");
				
				$('#wiw').show();
				$('#abtatndlv').show();
				$('#abtatregu').show();
				$('#e-sep_man_post').show();
				
				$('#info').hide();
				$('#atnd').hide();
				$('#ffs').hide();
				$('#reimb').hide();
				$('#bpay').hide();
				$('#tmgmt').hide();
				$('#wtsn').hide();
				$('#eoff').hide();
				$('#ins').hide();
				$('#rbfs').hide();
				$('#hrctrl').hide();
				$('#adctrl').hide();
				$('#cnj').hide();
				$('#epms').hide();
				$('#esep').hide();
				$('#hrpd').hide();
				$('#dueclarance_test').hide();
				$('#mss').hide();
				$('#whoswho').hide();
				$('#e-sep_hr_tab').hide();
				$('#e-sep_sa_tab').hide();
				$('#accdash').hide();
				$('#e-sep_acc_tab').hide();
				$('#hdesk').hide();
				
				$('#sidebar').load('postLoginJsp/PI/employeeoffer_menu.jsp');
				loadPage('postLoginJsp/MANAGERController/mgr_self_Image.jsp', '');
			/* 	loadPage('postLoginJsp/MANAGERController/open.jsp', ''); */
			})
			
			$("#wiw").click(function() {

				$('#sidebar').load('postLoginJsp/MANAGERController/mgrmenu1.jsp');
				loadPage('postLoginJsp/MANAGERController/mgr_self_Image.jsp', '');
		})
			
			$("#abtatndlv").click(function() {

				$('#sidebar').load('postLoginJsp/MANAGERController/mgrmenu2.jsp');
				loadPage('postLoginJsp/MANAGERController/mgr_self_Image.jsp', '');
		})
			$("#abtatregu").click(function() {

				$('#sidebar').load('postLoginJsp/MANAGERController/mgrmenu3.jsp');
				loadPage('postLoginJsp/MANAGERController/mgr_self_Image.jsp', '');
		})
			

			$("#e-sep_man_post").click(function() {

				$('#sidebar').load('postLoginJsp/e-separation_ELC/e_separation_menu.jsp');
				loadPage('postLoginJsp/MANAGERController/mgr_self_Image.jsp', '');
		})
		
		

		// employee life cycle
		
		$("#elc").click(function() {

			$('#cnj').show();
			$('#epms').show();
			$('#esep').show();
			$('#hrpd').show();
			$('#dueclarance_test').show();
			
			$('#info').hide();
			$('#atnd').hide();
			$('#ffs').hide();
			$('#reimb').hide();
			$('#bpay').hide();
			$('#tmgmt').hide();
			$('#wtsn').hide();
			$('#eoff').hide();
			$('#ins').hide();
			$('#rbfs').hide();
			$('#hrctrl').hide();
			$('#adctrl').hide();
			$('#wiw').hide();
			$('#abtatndlv').hide();
			$('#abtatregu').hide();
			$('#e-sep_man_post').hide();
			$('#whoswho').hide();
			$('#e-sep_hr_tab').hide();
			$('#e-sep_sa_tab').hide();
			$('#e-sep_acc_tab').hide();
			$('#hdesk').hide();
			$('#hdesk_query').hide();
			/* 	 $('#container').load('postLoginJsp/ELC/career_job_menu.jsp'); */
			/* loadPage('postLoginJsp/PI/empLifeCycle.jsp', '');	 */
			$('#sidebar').load('postLoginJsp/PI/employeeoffer_menu.jsp');
			/* loadPage('postLoginJsp/PI/empLifeCycle.jsp', ''); */
			loadPage('postLoginJsp/menus_ELC/employee_lifecycle_image.jsp', '');
		})
		
	
		$("#cnj").click(function() {
	
			$('#sidebar').load('postLoginJsp/menus_ELC/career_job_menu.jsp');
			loadPage('postLoginJsp/PI/empLifeCycle.jsp', '');
		})
		$("#epms").click(function() {

			$('#sidebar').load('postLoginJsp/menus_ELC/e-pms_menu.jsp');
			loadPage('postLoginJsp/PI/empLifeCycle.jsp', '');
		})
		$("#esep").click(function() {

			$('#sidebar').load('postLoginJsp/menus_ELC/e-separation_menu.jsp');
			loadPage('postLoginJsp/HRController/esep_image.jsp', '');
		})
		$("#hrpd").click(
				function() {
					$('#sidebar').load('postLoginJsp/menus_ELC/hr_policy_Doc_menu.jsp');
					loadPage('postLoginJsp/PI/empLifeCycle.jsp', '');
				})
		
		$("#dueclarance_test").click(function() {
					$('#sidebar').load('postLoginJsp/menus_ELC/Due_Clearance_menu.jsp');
					loadPage('postLoginJsp/Due_Clearance/duclearance_content_home.jsp', '');
				})
				
				
		//hr Dashboard
		
		/* $("#hrd").click(function() {
			alert("you can not access!!!please contact to ADMIN");
			// var id=1;
			// window.location = "HRDashboard?id=" +id; 
		}) */
		
		
		//employee offers
		$("#eoff").click(function() {
			$('#sidebar').load('postLoginJsp/PI/employeeoffer_menu.jsp');
			loadPage('postLoginJsp/PI/empOffers.jsp', '');
		})
		
		//benfits & payments
		$("#bpay").click(function() {

							$('#sidebar').load('postLoginJsp/Benifits_Payments/benifits_pay_menu.jsp');
							loadPage('postLoginJsp/PI/benfitsPayments.jsp', '');
						})
						
						
		//TRAVEL MANAGEMENT
		$("#tmgmt").click(function() {
			// $('#sidebar').load('postLoginJsp/PI/sideMenu.jsp');
			$('#sidebar').load('postLoginJsp/Travel_Management/travel_mgmt_menu.jsp');
			loadPage('postLoginJsp/PI/travelManagement.jsp', '');
		})

		$("#reimb").click(function() {
			// $('#sidebar').load('postLoginJsp/PI/sideMenu.jsp');
			$('#sidebar').load('postLoginJsp/Reimbursements/reimbursements_menu.jsp');
			loadPage('postLoginJsp/PI/reimbursements.jsp', '');

		})

		$("#ins").click(function() {
			// $('#sidebar').load('postLoginJsp/PI/sideMenu.jsp');
			$('#sidebar').load('postLoginJsp/Insurance/insurance_menu.jsp');
			loadPage('postLoginJsp/PI/insurance.jsp', '');
		})

		$("#rbfs").click(function() {
			$('#sidebar').load('postLoginJsp/Retiral_Benefits/retiral_benefits_menu.jsp');
			loadPage('postLoginJsp/PI/retiral_benifits.jsp', '');
		})

		$("#ffs").click(function() {
			$('#sidebar').load('postLoginJsp/PI/employeeoffer_menu.jsp');
			loadPage('postLoginJsp/PI/f_f_settelement.jsp', '');
		})
		

		$("#hdesk").click(function() {
		
			$('#sidebar').load('postLoginJsp/PI/employeeoffer_menu.jsp');
			loadPage('postLoginJsp/HELP_DESK/support.jsp', '');
		})

		//manager services
		$("#mss").click(function() {
			//alert("you are not a manager!!!if any query contact to ADMIN");
			
			$('#sidebar').load('postLoginJsp/MANAGERController/managercontroller_menu.jsp');
			loadPage('postLoginJsp/MANAGERController/managercontroll.jsp', '');
			
		})
		
		
		// HR DASHBOARD
		
		$("#hrd").click(function() {
					
			/* $(this).addClass('.nav_clicked'); */
			
			$('#e-sep_hr_tab').show();
			$('#cnj').hide();
			$('#epms').hide();
			$('#esep').hide();
			$('#hrpd').hide();
			$('#info').hide();
			$('#atnd').hide();
			$('#ffs').hide();
			$('#reimb').hide();
			$('#bpay').hide();
			$('#tmgmt').hide();
			$('#wtsn').hide();
			$('#eoff').hide();
			$('#ins').hide();
			$('#rbfs').hide();
			$('#hrctrl').show();
			
			$('#adctrl').hide();
			$('#wiw').hide();
			$('#abtatndlv').hide();
			$('#abtatregu').hide();
			$('#e-sep_man_post').hide();
			$('#whoswho').hide();
			$('#dueclarance_test').hide();
			$('#e-sep_sa_tab').hide();
			//$('#e-sep_a/c_tab').hide();
			$('#hdesk').hide();
			$('#sidebar').load('postLoginJsp/PI/employeeoffer_menu.jsp');
			loadPage('postLoginJsp/PI/empLifeCycle.jsp', '');
				
				})
		
		$("#e-sep_hr_tab").click(function() {
					//alert("hr controller");
					$('#sidebar').load('postLoginJsp/HRController/esep_menu.jsp');
					loadPage('postLoginJsp/HRController/esep_image.jsp', '');
				})
				
				
		$("#hrctrl").click(function() {
					//alert("hr controller");
					$('#sidebar').load('postLoginJsp/HRController/hrcontroller_menu.jsp');
					loadPage('postLoginJsp/HRController/createemp.jsp', '');
				})
				
		/* $("#adctrl").click(function() {
							//alert("you can not access write now");
							$('#sidebar').load('postLoginJsp/ADMINController/admincontroller_menu.jsp');
							loadPage('postLoginJsp/ADMINController/admincontrol.jsp','');
						}) */
						
						
		// ADMIN DASHBOARD  
		
		$("#admindash").click(function() {
			
			$('#adctrl').show();
			$('#e-sep_hr_tab').hide();
			$('#cnj').hide();
			$('#epms').hide();
			$('#esep').hide();
			$('#hrpd').hide();
			$('#info').hide();
			$('#atnd').hide();
			$('#ffs').hide();
			$('#reimb').hide();
			$('#bpay').hide();
			$('#tmgmt').hide();
			$('#wtsn').hide();
			$('#eoff').hide();
			$('#ins').hide();
			$('#rbfs').hide();
			$('#hrctrl').hide();
			
			$('#wiw').hide();
			$('#abtatndlv').hide();
			$('#abtatregu').hide();
			$('#e-sep_man_post').hide();
			$('#whoswho').hide();
			$('#dueclarance_test').hide();
			
			$('#accdash').hide();
			$('#e-sep_acc_tab').hide();
			$('#hdesk').hide();
			
		/* 	$('#sidebar').load('postLoginJsp/ADMINController/admincontroller_menu.jsp');
			loadPage('postLoginJsp/ADMINController/admincontrol.jsp',''); */
			
			/* $('#sidebar').load('postLoginJsp/PI/employeeoffer_menu.jsp'); */
			$('#sidebar').load('postLoginJsp/ADMINController/admincontroller_menu.jsp');
			loadPage('postLoginJsp/ADMINController/admin_defaultPage.jsp', '');
		})
						
		// SANCTIONING AUTHORITY 
		
		$("#sad").click(function() {
					
			/* $(this).addClass('.nav_clicked'); */
			$('#e-sep_sa_tab').show();
			$('#e-sep_hr_tab').hide();
			$('#cnj').hide();
			$('#epms').hide();
			$('#esep').hide();
			$('#hrpd').hide();
			$('#info').hide();
			$('#atnd').hide();
			$('#ffs').hide();
			$('#reimb').hide();
			$('#bpay').hide();
			$('#tmgmt').hide();
			$('#wtsn').hide();
			$('#eoff').hide();
			$('#ins').hide();
			$('#rbfs').hide();
			$('#hrctrl').hide();
			
			$('#adctrl').hide();
			$('#wiw').hide();
			$('#abtatndlv').hide();
			$('#abtatregu').hide();
			$('#e-sep_man_post').hide();
			$('#whoswho').hide();
			$('#dueclarance_test').hide();
			
			$('#accdash').hide();
			$('#e-sep_acc_tab').hide();
			$('#hdesk').hide();

			$('#sidebar').load('postLoginJsp/PI/employeeoffer_menu.jsp');
			loadPage('postLoginJsp/PI/empLifeCycle.jsp', '');
				
				})
				
				$("#e-sep_sa_tab").click(function() {
					//alert("hr controller");
					$('#sidebar').load('postLoginJsp/SA_Dashbord/e_sep_sa_menu.jsp');
					loadPage('postLoginJsp/HRController/createemp.jsp', '');
				})

				
				//  ACCOUNTANT DASHBOARD 
				
		$("#accdash").click(function() {
			
			/* $(this).addClass('.nav_clicked'); */
			
			$('#e-sep_acc_tab').show();
			$('#e-sep_sa_tab').hide();
			$('#e-sep_hr_tab').hide();
			$('#cnj').hide();
			$('#epms').hide();
			$('#esep').hide();
			$('#hrpd').hide();
			$('#info').hide();
			$('#atnd').hide();
			$('#ffs').hide();
			$('#reimb').hide();
			$('#bpay').hide();
			$('#tmgmt').hide();
			$('#wtsn').hide();
			$('#eoff').hide();
			$('#ins').hide();
			$('#rbfs').hide();
			$('#hrctrl').hide();
			
			$('#adctrl').hide();
			$('#wiw').hide();
			$('#abtatndlv').hide();
			$('#abtatregu').hide();
			$('#e-sep_man_post').hide();
			$('#whoswho').hide();
			$('#dueclarance_test').hide();
			$('#hdesk').hide();

			$('#sidebar').load('postLoginJsp/PI/employeeoffer_menu.jsp');
			loadPage('postLoginJsp/PI/empLifeCycle.jsp', '');
				
				})
				
				$("#e-sep_acc_tab").click(function() {
					$('#sidebar').load('postLoginJsp/Accountant_Dashboard/e_sep_account_menu.jsp');
					loadPage('postLoginJsp/HRController/createemp.jsp', '');
				})

				//HELP DESK TAB
				
				$("#hdesk_query").click(function() {
					
					$('#sidebar').load('postLoginJsp/HELP_DESK/help_desk_menu.jsp');
					loadPage('postLoginJsp/HRController/createemp.jsp', '');
				})
				// DUE CLEARANCE 
		
	/* 	$("#it_support_team_tab").click(function() {
			$('#sidebar').load('postLoginJsp/PI/employeeoffer_menu.jsp');
			// loadPage('postLoginJsp/Due_Clearance/it_support_dueclear.jsp', ''); 
			loadPage('postLoginJsp/Due_Clearance/it_support_dueclear_initial.jsp', '');

		}) */
	})

	/* $(function() {

		$("#atnd").click(function() {
				alert("atnd");
			$('#sidebar').load('postLoginJsp/ATND/atnd_menu.jsp');
			loadPage('postLoginJsp/ATND/worktime.jsp', '');
			//loadPage('postLoginJsp/PI/personalinfo_menu1.jsp', '');

		})
	}) */
	
		

	function openPage(id) {

		//alert(id);

		var url, dataString;

		if (id == "WHATSNEW") {

			url = "postLoginJsp/PI/whatnew.jsp";
			dataString = "";

		} else if (id == "NEWS") {

			url = "postLoginJsp/PI/news.jsp";
			dataString = "";

		} 
		
		if (id == "EMP_SEARCH") {

		url = "postLoginJsp/WHOSWHO/employee_search.jsp"; 
		/* 	url = "postLoginJsp/WHOSWHO/empsearch_test.jsp"; */
			/* 	url = "postLoginJsp/WHOSWHO/index.jsp";  */
			
			dataString = "";

		} else if (id == "R_MATRIX") {

			url = "postLoginJsp/WHOSWHO/r_matrix.jsp";
			dataString = "";

		} 
		
		
		else if (id == "PROF") {

			url = "postLoginJsp/PI/personalProfile.jsp";
			dataString = "";

		} else if (id == "QAL") {

			url = "postLoginJsp/PI/qualification.jsp";
			dataString = "";

		} else if (id == "PE") {

			url = "postLoginJsp/PI/previousEmployer.jsp";
			dataString = "";

		} else if (id == "NOM") {

			url = "postLoginJsp/PI/nominations.jsp";
			dataString = "";

		} else if (id == "PAN") {

			url = "postLoginJsp/PI/panRetrials.jsp";
			dataString = "";

		} else if (id == "PHC") {

			url = "postLoginJsp/ATND/publicholiday.jsp";
			dataString = "";

		} else if (id == "ATNDQRY") {

			url = "postLoginJsp/ATND/attendancequery.jsp";
			dataString = "";

		} else if (id == "PWRKTYM") {

			url = "postLoginJsp/ATND/worktime.jsp";
			dataString = "";

		} else if (id == "LOVAR") {

			url = "postLoginJsp/ATND/leaveoverview.jsp";
			dataString = "";

		} else if (id == "LR") {

			url = "postLoginJsp/ATND/leaverequest.jsp";
			dataString = "";

		} else if (id == "LE") {

			url = "postLoginJsp/ATND/leaveEncashment.jsp";
			dataString = "";

		} else if (id == "ta") {

			url = "postLoginJsp/ATND/timeaccounts.jsp";
			dataString = "";
		}/* else if (id == "lrs") {
				url = "postLoginJsp/ATND/leaverequest.jsp";
				dataString = "";

				} */
				
	/* FOR ATND RESPONSE */
		else if (id == "qryBtn") {

			var month = $('#month').val();
			var year = $('#year').val();
			var emp_id_pass=$('#emp_id_pass').val();

			if (month == "none selected" || year == "none selected") {
				alert("Please Select Month ! ");

				return false;

			} else {
				var url = 'postLoginJsp/ATND/attendancequerySuccess.jsp';
				/* var url = 'AttendanceDetails.java'; */
				var dataString = 'month=' + month + '&year=' + year + '&emp_id_pass=' + emp_id_pass;

				qryPage(url, dataString);

				return true;

			}
		}

				else if (id == "salarybrekupbtn") {

					//alert("salarybrekupbtn");
					var ctc = $('#ctc').val();
					
					var basic_per = $('#basic_per').val();
					if (ctc == "") {
						alert("Please Enter CTC ! ");
						return false;

					}else if (basic_per=="none select") {
						alert("Please select basic percent ! ");
						return false;

					} else {
						var url = 'postLoginJsp/ADMINController/salaryBreakupStructureDisplay.jsp';
						/* var url = 'AttendanceDetails.java'; */
						var dataString = '&ctc=' + ctc + '&basic_per='+basic_per;

						qryPage(url, dataString);

						return true;

					}
				}
		/* f and f settlement */
		
		else if (id == "open_newpage_fandf") {

					alert("open_newpage_fandf");
					var seq_no = $('#seq_no').val();

					if (seq_no == "") {
						alert("Please select sequence number ! ");
						return false;

					} else {
						var url = 'postLoginJsp/HRController/fullnfinal_hr_action_click_report.jsp';
						var dataString = 'seq_no=' + seq_no;

						qryPage(url, dataString);

						return true;

					}
				}
		
		
		
		
		

		/* else if (id == PayqryBtn") {
		 var month = $('#month').val();
		 var year = $('#year').val();
		 if (month == "none selected" || year == "none selected") {
		 alert("Please Select Month ! ");

		 return false;

		 } else {
		 //alert(" month==="+month+"Year==="+year);
		 var url = 'postLoginJsp/Benifits_Payments/payslipquerySuccess.jsp'; 
		 var dataString = 'month=' + month + '&year=' + year;

		 qryPage(url, dataString);
		 return true;
		 }
		 } */

		/* else if (id == "delBtn") {
			var sid = $('#sid').val(); 
			if (confirm("Are you sure to delete this record???")) {
				
				alert("succesfully deleted record:" + sid);
				var url = 'postLoginJsp/ATND/leaveOverviewActionRslt.jsp';
				var dataString = "&sid="+sid;

			}else {
				return false;
			}
			alert("succesfully deleted record:" + sid);
			
			leaveOvrvwSuccess(url, dataString);
			return true;
		} */
		
		else if (id == "editSub") {

			url = "postLoginJsp/ATND/leaveOverviewEditSuccess.jsp";
			dataString = "";

		} 
		
		
		// 	FOR HR CONTROLLER INSIDE SIDEBAR 
		
		
		else if (id == "CE_HRC") {

		/* 	url = "postLoginJsp/HRController/createemp.jsp"; */
		url = "postLoginJsp/ADMINController/admcreateemp.jsp";
			dataString = "";

		} else if (id == "VE_HRC") {

			/* url = "postLoginJsp/HRController/view_edit.jsp"; */
			url = "postLoginJsp/ADMINController/view_edit.jsp";
			dataString = "";
			
		}else if (id == "VEMPR_HRC") {

			/* url = "postLoginJsp/HRController/view_edit.jsp"; */
			url = "postLoginJsp/ADMINController/viewempresign.jsp";
			dataString = "";
		}
		
		
		
		
// HR CONTROLLER ESEPARATION

		else if (id == "ESEP_USERMANUAL_HRD") {

			 url = "postLoginJsp/HRController/usermanual_hr.jsp";
			dataString = "";
		}
		
		else if (id == "ESEP_REQ_HRD") {

			/*  url = "postLoginJsp/HRController/eSep-Request_hr.jsp"; */
			/*  url = "postLoginJsp/HRController/eSep-Request_hr2.jsp"; */
				url = "postLoginJsp/HRController/e_sep_hr_initial_page.jsp";
			 
			dataString = "";
		}
		else if (id == "ESEP_APPROVAL_HRD") {

			 url = "postLoginJsp/HRController/eSep-Approval_hr.jsp"; 
			dataString = "";
		}
		else if (id == "ESEP_OVERVIEW_HRD") {

			 //url = "postLoginJsp/HRController/eSep-hroverview_hr.jsp";
			 //url = "postLoginJsp/HRController/e_sep_hr_overview_coresspandance_letter_initialpage.jsp";
			 url = "postLoginJsp/HRController/hr_overview_initial_page_a.jsp";
			dataString = "";
		}
		else if (id == "ESEP_CLEAR_HRD") {
			url = "postLoginJsp/HRController/eSep-Clearance_hr.jsp";
			dataString = "";
		}
		else if (id == "ESEP_EXTINTERVIEW_HRD") {
			url = "postLoginJsp/HRController/eSep-Exitinterview_hr.jsp"; 
			dataString = "";
		}
		//modified on 17/11/2015
		else if (id == "ESEP_FNF_HRD") {
			 //url = "postLoginJsp/HRController/eSep-FullnFinal_hr.jsp";
			 url="postLoginJsp/HRController/full_final_hr_fetching_display.jsp";
			dataString = "";
		}
		/* FOR TESTING PUPOSE ONLY */
		
		else if (id == "ESEP_FNF_TEST_HRD") {
			 //url = "postLoginJsp/HRController/eSep-FullnFinal_hr.jsp";
			 url="postLoginJsp/HRController/fnfworksheet_hr_TEST.jsp";
		//url="postLoginJsp/HRController/fnfworksheet_hr_TEST1.jsp";
			dataString = "";
		}
		
		
		
		 else if (id == "hrcreatereq") {
				//alert("hr create request");
			var empid=$('#empid').val();
			//	alert(empid);

			if(empid==""|| empid==null|| empid=="none selected"){
				alert("Please enter employee id ! ");
				return false;
				}
			 else {
				var url = 'postLoginJsp/HRController/eSep-hroverview_cr_hr.jsp';
				var dataString = '&empid=' +empid;

				qryPage(url, dataString);
				return true;
			}
		}
		
		
		// SANCTIONING AUTHORITY DASHBOARD 
		
		else if (id == "ESEP_FNF_SAD") {

			url = "postLoginJsp/SA_Dashbord/sa_initialpage.jsp";
			dataString = "";

		}
		
		
		// ACCOUNTANT DASHBOARD 
		
		else if (id == "ESEP_FNF_A/CDASH") {

			url = "postLoginJsp/Accountant_Dashboard/accountant_initialpage.jsp";
			dataString = "";

		}
		
		
		//  FOR ADMIN CONTROLLER INSIDE SIDEBAR
		
		else if (id == "CE_ADMCTRL") {

			url = "postLoginJsp/ADMINController/admcreateemp.jsp";
			dataString = "";

		} else if (id == "VE_ADMCTRL") {

			url = "postLoginJsp/ADMINController/view_edit.jsp";
			dataString = "";

		} else if (id == "VEMPR_ADMCTRL") {

			url = "postLoginJsp/ADMINController/viewempresign.jsp";
			dataString = "";
		} else if (id == "EXISTEMP_ADMCTRL") {

			url = "postLoginJsp/ADMINController/existempreport.jsp";
			dataString = "";

		} else if (id == "NEXISTEMP_ADMCTRL") {

			url = "postLoginJsp/ADMINController/nexistempreport.jsp";
			dataString = "";

		} else if (id == "EMPATND_ADMCTRL") {

			url = "postLoginJsp/ADMINController/empatndreport.jsp";
			dataString = "";

		} else if (id == "GENTAXPROJSTMT_ADMCTRL") {

			url = "postLoginJsp/ADMINController/generateTaxProjStmt.jsp";
			dataString = "";

		}else if (id == "TAXPROJSTMTR_ADMCTRL") {

				url = "postLoginJsp/ADMINController/taxprojectionstmtreport.jsp";
				dataString = "";

			}
		else if (id == "SAL_BREAKUP_STMT_ADMCTRL") {

			url = "postLoginJsp/ADMINController/salarybreakup.jsp";
			dataString = "";

		}
		
		else if (id == "E_VOUCHER_REPORT_ADMCTRL") {

			url = "postLoginJsp/ADMINController/e_voucher_report.jsp";
			dataString = "";

		}
		
		else if (id == "EXPENSE_ENTRY_REPORT_ADMCTRL") {

			url = "postLoginJsp/ADMINController/expense_entry_report.jsp";
			dataString = "";

		}
		
		
		//adding extra code

		else if (id == "CMPPF_ADCTRL") {

			url = "postLoginJsp/ADMINController/aboutNCSS.jsp";
			dataString = "";

		}

		else if (id == "NACMPNY_ADCTRL") {

			url = "postLoginJsp/ADMINController/newsaboutCompnay.jsp";
			dataString = "";

		}

		else if (id == "NAESS_ADCTRL") {

			url = "postLoginJsp/ADMINController/aboutESS.jsp";
			dataString = "";

		}
		/* FOR ADMIN CONFIGURATION  */
	
		 else if (id == "PAYCONF_ADMCTRL") {
				url = "postLoginJsp/ADMINController/payslipConfig.jsp";
				dataString = "";
			}
		 else if (id == "TPSCONF_ADMCTRL") {

				url = "postLoginJsp/ADMINController/taxproConfig.jsp";
				dataString = "";
			}
		 else if (id == "CTCSCONF_ADMCTRL") {

				url = "postLoginJsp/ADMINController/ctcConfig.jsp";
				dataString = "";

			}
		 else if (id == "RPAYROLE_ADMCTRL") {

				url = "postLoginJsp/ADMINController/runpayrole.jsp";
				dataString = "";

			}
		 else if (id == "GENCTCSTMT_ADMCTRL") {

				url = "postLoginJsp/ADMINController/genctcstmt.jsp";
				dataString = "";

			}
		
		//leaves configuration and leaves assign
		
		else if (id == "LEAVES_CONFIG_ADMCTRL") {

				url = "postLoginJsp/ADMINController/leaves_configuration_emp.jsp";
				dataString = "";

			}
		else if (id == "LEAVES_ASSIGN_ADMCTRL") {

			url = "postLoginJsp/ADMINController/leaves_assign_for_employees.jsp";
			dataString = "";

		}
		
		else if (id == "ATT_CONFIG_ADMCTRL") {

			url = "postLoginJsp/ADMINController/Attendance_empNumber_configuration.jsp";
			dataString = "";
		}
		
		/* FOR BANK INFORMATION  */
		
		  else if (id == "NEMPBNKD_ADMCTRL") {
				url = "postLoginJsp/ADMINController/newEmpBankDetails.jsp";
				dataString = "";
			}
		
		  else if (id == "BNKD_ADMCTRL") {
				url = "postLoginJsp/ADMINController/existEmpBankDetails.jsp";
				dataString = "";
			}
		
		  else if (id == "bankinfoqrybtn") {
					//	alert("inside bankinfoqrybtn btn");
					var empid=$('#choose').val();
					
					if(empid=="none selected" ){
						alert("Please enter employee id ! ");
						return false;
					}
				else {
						var url = 'postLoginJsp/ADMINController/bankInfoInsert.jsp';
						/* var url = 'AttendanceDetails.java'; */
						var dataString = '&empid=' +empid;
						qryPage(url, dataString);
						return true;
					}
				}
			
		
			else if (id == "bankinfoqryupdatebtn") {
				//	alert("inside bankinfoqrybtn btn");
				var empid=$('#choose').val();
				
				if(empid=="none selected" ){
					alert("Please enter employee id ! ");
					return false;
				}
				else {

					var url = 'postLoginJsp/ADMINController/bankInfoUpdate.jsp';
					/* var url = 'AttendanceDetails.java'; */
					var dataString = '&empid=' +empid;
					qryPage(url, dataString);

					return true;

				}
			}
		
		/* for leave configuration */
			 else if (id == "updateleave_config") {
			//alert("inside updateleave_config btn");
				var pl=$('#pl').val();
				var sl = $('#sl').val();
				var cl = $('#cl').val();
				var advpl = $('#advpl').val();
				var advsl = $('#advsl').val();
				var compoff = $('#compoff').val();
				

				if(pl=="" || pl==null ){
					pl="0.0";
				}if(sl=="" || sl==null ){
					sl="0.0";
				}if(cl=="" || cl==null ){
					cl="0.0";
				}if(advpl=="" || advpl==null ){
					advpl="0.0";
				}if(advsl=="" || advsl==null ){
					advsl="0.0";
				}if(compoff=="" || compoff==null ){
					compoff="0.0";
				}


				/* 	if (month == "none selected" || year == "none selected") {

					alert("Please Select Month ! ");
					return false;

				} else { */

					var url = 'postLoginJsp/ADMINController/leaves_configuration_emp_update.jsp';
					/* var url = 'AttendanceDetails.java'; */
					var dataString = '&pl=' +pl + '&sl=' + sl + '&cl=' + cl+ '&advpl=' +advpl + '&advsl=' + advsl + '&compoff=' + compoff;
					alert(dataString)

					qryPage(url, dataString);

					return true;

				/* } */
			}
		
		
		/* FOR LEAVE ASSIGN TO PARTICULAR EMPLOYEE */
		
		 else if (id == "updateleave_Assing") {
		alert("inside updateleave_Assing btn");
			
			var pl=$('#pl').val();
			var sl = $('#sl').val();
			var cl = $('#cl').val();
			var advpl = $('#advpl').val();
			var advsl = $('#advsl').val();
			var compoff = $('#compoff').val();
			

			if(pl=="" || pl==null ){
				pl="0.0";
			}if(sl=="" || sl==null ){
				sl="0.0";
			}if(cl=="" || cl==null ){
				cl="0.0";
			}if(advpl=="" || advpl==null ){
				advpl="0.0";
			}if(advsl=="" || advsl==null ){
				advsl="0.0";
			}if(compoff=="" || compoff==null ){
				compoff="0.0";
			}


			/* 	if (month == "none selected" || year == "none selected") {

				alert("Please Select Month ! ");
				return false;

			} else { */

				var url = 'postLoginJsp/ADMINController/leaves_assing_employee.jsp';
				/* var url = 'AttendanceDetails.java'; */
				var dataString = '&pl=' +pl + '&sl=' + sl + '&cl=' + cl+ '&advpl=' +advpl + '&advsl=' + advsl + '&compoff=' + compoff;
				alert(dataString)

				qryPage(url, dataString);

				return true;

			/* } */
		}
		
		/* PAYROLL GENERATE BUTTON */
		
		 else if (id == "payrollqryBtn") {
				//alert("inside payrollqry btn");
			var empid=$('#choose').val();
			var month = $('#month').val();

			var year = $('#year').val();
			if(empid=="none selected" ){

				alert("Please enter employee id ! ");
				return false;
			}

			if (month == "none selected" || year == "none selected") {

				alert("Please Select Month ! ");
				return false;

			} else {

				var url = 'postLoginJsp/Benifits_Payments/runpayrollfetchdata.jsp';
				/* var url = 'AttendanceDetails.java'; */
				var dataString = '&empid=' +empid + '&month=' + month + '&year=' + year;

				qryPage(url, dataString);

				return true;

			}
		}
		
		
		
		 else if (id == "E_SEP_ADMIN_CONTROLL") {
				url = "postLoginJsp/Admin_e_separation/admin_initial_e_separation.jsp";
				dataString = "";
				
			} 
			 
			 else if (id == "E_VOUCHER_ADMCTRL") {

					url = "postLoginJsp/ADMINController/e_voucher_initial_form.jsp";
					dataString = "";
					
				} 
			  else if (id == "EXPENTRYFRM_ADMCTRL") {
					url = "postLoginJsp/ADMINController/expense_entry_initial_form.jsp";
					dataString = "";
				}
		
		
		
		 else if (id == "selectitembtn") {
			
			 var select_item=$('#choose_expense_item').val();
			 var select_item_month=$('#month').val();
			 var select_item_year=$('#year').val();
				
				if(select_item=="none selected" || choose_expense_item=="ALL" ){
					alert("Please select expense entry item  ! ");
					return false;
				}
				if(select_item_month=="none selected" ){
					alert("Please select month ! ");
					return false;
				}
				
			else 
			{
				if(select_item=="COURIER EXPENSES"){
					var url1 = "postLoginJsp/ADMINController/courier_expense_ee.jsp";
									}
				else{
					var url1= "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				
					/*  var url = 'postLoginJsp/ADMINController/telephone_expense_ee.jsp';  */
					 var url = url1; 
					var dataString = '&select_item=' +select_item+ '&select_item_month=' +select_item_month+ '&select_item_year=' +select_item_year;
					qryPage(url, dataString);
					return true;
				}
				
			
			}
		
		/*  else if(id=="choose_expense_item")
			{
				var i=$( "#choose_expense_item option:selected" ).text();
		
				alert(i);
				if(i=="TELEPHONE EXPENSES"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="ELECTRICITY - BEST"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="STATIONERY"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="HOUSE KEEPING"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="TEA COFFEE & BISCUITS"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="NEWS PAPER"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="PAPER CUPS"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="TISSUE ROLL"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="FLOWERS"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="TOPS SECURITY"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="OUTSOURCE EMPLOYEE"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="COURIER EXPENSES"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="HCL - XEROX"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="PRINTING EXP."){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="PRINTER CARTRIDGE"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="REPAIRS_MAINTENANCE"){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				if(i=="MIS. EXP."){
					url = "postLoginJsp/ADMINController/telephone_expense_ee.jsp";
				}
				
				
			}
		 */
		
		
		
		/*  FOR MANAGER CONTROLL  */
		 else if (id == "WIWPAGE_MSSCTRL") {
				url = "postLoginJsp/MANAGERController/whoiswho.jsp";
				dataString = "";
			}
		 else if (id == "ATNDLEAVE_MSSCTRL") {
				url = "postLoginJsp/MANAGERController/aboutAtndLeave.jsp";
				dataString = "";
			}
		 else if (id == "MAN_REGUL_MSSCTRL") {
				url = "postLoginJsp/MANAGERController/regularization_process.jsp";
				dataString = "";
			}
		
		
		
		
/* BENEFITS & PAYMENTS */
		else if (id == "B_PAY") {

			url = "postLoginJsp/Benifits_Payments/benfitsPayments.jsp";
			dataString = "";

		} else if (id == "PAY") {

			url = "postLoginJsp/Benifits_Payments/payslip.jsp"; 
			/* url = "postLoginJsp/Benifits_Payments/payslip1_test.jsp"; */
			/*  url="postLoginJsp/Benifits_Payments/payslip1.jsp";  */
			dataString = "";

		} else if (id == "CTC") {

			/* url = "postLoginJsp/Benifits_Payments/print_current_ctc.jsp";  */
			url = "postLoginJsp/Benifits_Payments/print_current_ctc_test.jsp";

			dataString = "";

		}else if (id == "PCTC") {
				url = "postLoginJsp/Benifits_Payments/ctc_after_join.jsp";
				dataString = "";
				
		}else if (id == "TAXPRO") {

			url = "postLoginJsp/Benifits_Payments/tax_projection_stmt.jsp";
			dataString = "";

		} else if (id == "INVESTDEC") {

			url = "postLoginJsp/Benifits_Payments/invest_declaration.jsp";
			dataString = "";

		} else if (id == "IDECPRINT") {

			url = "postLoginJsp/Benifits_Payments/invest_declaration_print.jsp";
			dataString = "";

		} else if (id == "INTHOME") {

			url = "postLoginJsp/Benifits_Payments/interest_home_loan.jsp";
			dataString = "";

		} else if (id == "EXP") {

		/*   url = "postLoginJsp/Benifits_Payments/expense_entry.jsp";  */
			url = "postLoginJsp/Benifits_Payments/testexpentry.jsp";  
			dataString = "";

		} else if (id == "EXPGEN") {

			url = "postLoginJsp/Benifits_Payments/expense_frm_generation_deletion.jsp";
			dataString = "";

		} else if (id == "EXPPRINT") {

			url = "postLoginJsp/Benifits_Payments/expense_frm_printing.jsp";
			dataString = "";

		} else if (id == "FUEL") {

			url = "postLoginJsp/Benifits_Payments/fuel_maintainance_details.jsp";
			dataString = "";

		} else if (id == "CHOICEPAYSOP") {

			url = "postLoginJsp/Benifits_Payments/choicePaySop.jsp";
			/* url = "postLoginJsp/Benifits_Payments/choicepaytest1.jsp"; */
			dataString = "";

		}else if (id == "CHOICEPAY") {

			url = "postLoginJsp/Benifits_Payments/choice_pay_entry.jsp";
			/* url = "postLoginJsp/Benifits_Payments/choicepaytest1.jsp"; */
			dataString = "";

		} else if (id == "choice_rev") {

			url = "postLoginJsp/Benifits_Payments/choicepay_success.jsp";
			/* url = "postLoginJsp/Benifits_Payments/choicepaytest1.jsp"; */
			dataString = "";

		} else if (id == "CHOICEPAY_DISPLAY") {

			url = "postLoginJsp/Benifits_Payments/choicepay_display.jsp";
			/* url = "postLoginJsp/Benifits_Payments/choicepaytest1.jsp"; */
			dataString = "";

		} else if (id == "F16") {

			/* var popupWindow = window
					.open('postLoginJsp/Benifits_Payments/form_16.jsp?',"_blank",
							"directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=800, height=680,top=200,left=200"); */
		url = "postLoginJsp/Benifits_Payments/form_16_home.jsp";
			dataString = "";

		} else if (id == "GUIDEF16") {
			/* var popupWindow = window
					.open('postLoginJsp/Benifits_Payments/guidelines_form_16.jsp?',"_blank",
							"directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=800, height=680,top=200,left=200");
			 */
			url = "postLoginJsp/Benifits_Payments/guidelines_form_16_home.jsp"; 
			dataString = "";

		}
		
		/* TRAVEL MANAGEMENT JSP PAGES STARTS  */
			
		else if (id == "TRVL_MGMT_ESS") {

			url = "postLoginJsp/Travel_Management/travel_mgmt.jsp";
			dataString = "";
		}
		else if (id == "DOM_TRVL_REQ_ESS") {

			url = "postLoginJsp/Travel_Management/domestic_travel_req_initial.jsp";
			dataString = "";
		}
		
		else if (id == "create_dtr_btn") {

			url = "postLoginJsp/Travel_Management/create_dom_travel_req.jsp";
			dataString = "";
		}
		
		
		else if (id == "back_dtr_initial") {

			url = "postLoginJsp/Travel_Management/domestic_travel_req_initial.jsp";
			dataString = "";
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		else if (id == "RESCH_TRIP_ESS") {

			url = "postLoginJsp/Travel_Management/reschedule_trip.jsp";
			dataString = "";
		}
		
		else if (id == "USR_MAN_ESS") {

			url = "postLoginJsp/Travel_Management/user_manual_travel_mgmt.jsp";
			dataString = "";
		}
		else if (id == "OVER_TRVL_REQ_ESS") {

			url = "postLoginJsp/Travel_Management/overseas_travel_req.jsp";
			dataString = "";
		}
		
		else if (id == "OVER_TRVL_REQ_APR_ESS") {

			url = "postLoginJsp/Travel_Management/overseas_travel_req_aprovel.jsp";
			dataString = "";
		}
		
		else if (id == "OVER_TRVL_MIS_REPORT_ESS") {

			url = "postLoginJsp/Travel_Management/overseas_travel_mis_reports.jsp";
			dataString = "";
		}
		
		else if (id == "OVER_TRVL_USR_MAN_ESS") {

			url = "postLoginJsp/Travel_Management/overseas_travel_user_manual.jsp";
			dataString = "";
		}
		
		else if (id == "PASS_DETAIL_ESS") {

			url = "postLoginJsp/Travel_Management/passport_detail_travel_mgmt.jsp";
			dataString = "";
		}
		
		
		
	
		
		
		
		
		/* TRAVEL MANAGEMENT JSP PAGES ENDS  */
		
		
		
		/* REIMBURSEMENTS JSP PAGES STARTS   */
		
		else if (id == "REIMBURS_ESS") {

			url = "postLoginJsp/Reimbursements/reimbursements.jsp";
			dataString = "";
		}
		else if (id == "LOCAL_CONVE_ESS") {

			url = "postLoginJsp/Reimbursements/local_conveyance.jsp";
			dataString = "";
		}
		else if (id == "TELEPHONE_ESS") {

			url = "postLoginJsp/Reimbursements/telephone_reimbursement.jsp";
			dataString = "";
		}
		else if (id == "LTA_ESS") {

			url = "postLoginJsp/Reimbursements/lta_reimbursement.jsp";
			dataString = "";
		}
		else if (id == "ACCI_REPAIR_ESS") {

			url = "postLoginJsp/Reimbursements/accident_repairs.jsp";
			dataString = "";
		}
		else if (id == "OTHER_REIMBURS_ESS") {

			url = "postLoginJsp/Reimbursements/other_reimbursement.jsp";
			dataString = "";
		}
		else if (id == "TTD_CLAIM_ESS") {

			url = "postLoginJsp/Reimbursements/ttd_claim.jsp";
			dataString = "";
		}
		else if (id == "CLAIM_PRINT_MEDI_ESS") {

			url = "postLoginJsp/Reimbursements/claim_print_medical.jsp";
			dataString = "";
		}
		else if (id == "CLAIM_PRINT_GEN_ESS") {

			url = "postLoginJsp/Reimbursements/claim_print_general.jsp";
			dataString = "";
		}
		else if (id == "REIMBURS_SUMM_ESS") {

			url = "postLoginJsp/Reimbursements/reimbursement_summary.jsp";
			dataString = "";
		}
		else if (id == "REIMBURS_CLAIM_STATUS_ESS") {

			url = "postLoginJsp/Reimbursements/reimbursement_claim_status.jsp";
			dataString = "";
		}
		else if (id == "REIMBURS_SLIP_ESS") {

			url = "postLoginJsp/Reimbursements/reimbursement_slip.jsp";
			dataString = "";
		}
		
		
		/* REIMBURSEMENTS JSP PAGES ENDS   */
		
		
		
		
		/* INSURANCE JSP PAGES STARTS   */
		
		else if (id == "SELF_SP_CH_MEDICLAIM_ESS") {

			url = "postLoginJsp/Insurance/self_spouse_n_child_mediclaim.jsp";
			dataString = "";
		}
		else if (id == "LIFE_INSU_POLICY_ESS") {

			url = "postLoginJsp/Insurance/life_insurance_policy.jsp";
			dataString = "";
		}
		else if (id == "PARENT_GRP_MEDICLAIM_ESS") {

			url = "postLoginJsp/Insurance/parent_group_mediclaim.jsp";
			dataString = "";
		}
		else if (id == "INSURANCE_DETAIL_ESS") {

			url = "postLoginJsp/Insurance/insurance_details.jsp";
			dataString = "";
		}
		
		
		/* INSURANCE JSP PAGES ENDS   */
		
		
		
			/* RETIRAL BENEFITS JSP PAGES STARTS   */
			
			else if (id == "FORMS_ESS") {

			url = "postLoginJsp/Retiral_Benefits/form_retiral_benefits.jsp";
			dataString = "";
		}
			else if (id == "PF_NOMINI_ESS") {

				url = "postLoginJsp/Retiral_Benefits/pf_nomination.jsp";
				dataString = "";
			}
			else if (id == "GRATUITY_NOMINI_ESS") {

				url = "postLoginJsp/Retiral_Benefits/gratuity_nomination.jsp";
				dataString = "";
			}
			else if (id == "SUPERNNUATION_NOMINI_ESS") {

				url = "postLoginJsp/Retiral_Benefits/supernnuation_nomination.jsp";
				dataString = "";
			}
			else if (id == "TRANS_PF_TRUST_ESS") {

				url = "postLoginJsp/Retiral_Benefits/transfer_from_other_pf_trust.jsp";
				dataString = "";
			}
			else if (id == "TRANS_SUPERNNUATION_ESS") {

				url = "postLoginJsp/Retiral_Benefits/transfer_of_superannuation.jsp";
				dataString = "";
			}
			else if (id == "FAQ_RETIRAL_BENE_ESS") {

				url = "postLoginJsp/Retiral_Benefits/faq_on_retiral_benefits.jsp";
				dataString = "";
			}
			else if (id == "PF_SLIP_2011_ESS") {

				url = "postLoginJsp/Retiral_Benefits/pf_slip_2011_onwards.jsp";
				dataString = "";
			}
			else if (id == "SUPERNNUATION_SLIP_ESS") {

				url = "postLoginJsp/Retiral_Benefits/superannuation_slip.jsp";
				dataString = "";
			}
		
			
				/* RETIRAL BENEFITS JSP PAGES ENDS   */
		
		else if (id == "CAJ_ELC") {

			url = "postLoginJsp/carrerandJob_ELC/carrer_and_job.jsp";
			dataString = "";
		} else if (id == "ICO_ELC") {

			url = "postLoginJsp/carrerandJob_ELC/internal_carrer_oppertunities.jsp";
			dataString = "";
		} else if (id == "RAF_ELC") {

			url = "postLoginJsp/carrerandJob_ELC/refer_friend.jsp";
			dataString = "";
		} else if (id == "RFUM_ELC") {

			url = "postLoginJsp/carrerandJob_ELC/refer_friend_usermanual.jsp";
			dataString = "";
		}

		else if (id == "REFAF_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/refer_friend.jsp";
			dataString = "";
		} else if (id == "CONFPLC_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/confirmation_policy.jsp";
			dataString = "";
		} else if (id == "ALP_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/attendance_leave_policy.jsp";
			dataString = "";
		} else if (id == "PHP_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/phone_policy.jsp";
			dataString = "";
		} else if (id == "DTP_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/domestic_travel_policy.jsp";
			dataString = "";
		} else if (id == "OTP_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/overseas_travel_policy.jsp";
			dataString = "";
		} else if (id == "EPE_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/emp_participation_events.jsp";
			dataString = "";
		} else if (id == "IEF_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/infrastructure_emp_facilities.jsp";
			dataString = "";
		} else if (id == "EHMP_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/emp_health_manage_policy.jsp";
			dataString = "";
		} else if (id == "GEC_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/guidelines_external_commu.jsp";
			dataString = "";
		} else if (id == "SEPP_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/separatioin_policy.jsp";
			dataString = "";
		}

	
		else if (id == "AD_ELC") {

			url = "postLoginJsp/e-pms_ELC/apprisal_document.jsp";
			dataString = "";
		} else if (id == "ADP_ELC") {

			url = "postLoginJsp/e-pms_ELC/apprisal_document_apparise.jsp";
			dataString = "";
		} else if (id == "PRAP_ELC") {

			url = "postLoginJsp/e-pms_ELC/pms_rating_payouts.jsp";
			dataString = "";
		} else if (id == "PMSUM_ELC") {

			url = "postLoginJsp/e-pms_ELC/user_manual.jsp";
			dataString = "";
		}
		
		else if (id == "ESR_ELC") {
			 url = "postLoginJsp/e-separation_ELC/eSeparation_request.jsp"; 
			dataString = "";
		}  
		
		
		else if (id == "New_Separation") {
			 url = "postLoginJsp/e-separation_ELC/e_separation_policy.jsp"; 
			dataString = "";
		}  
		
		
		 else if (id == "ESC_ELC") {

			url = "postLoginJsp/e-separation_ELC/eSeparation_clearance.jsp";
			dataString = "";

		} else if (id == "ESEI_ELC") {

			url = "postLoginJsp/e-separation_ELC/eSeparation_exit_interview.jsp";
			dataString = "";
		} else if (id == "ESUM_ELC") {

			url = "postLoginJsp/e-separation_ELC/usermanual.jsp";
			dataString = "";

		}
		
		
		/* admin employee search based on empid */
		
		 else if (id == "esep_searchemp") {
			var empid=$('#choose').val();
			
			if(empid=="none selected" ){
				alert("Please enter employee id ! ");
				return false;
				
			} else {
				var url = 'postLoginJsp/Admin_e_separation/admin_e_separation_status.jsp';
				var dataString = '&empid=' +empid ;

				qryPage(url, dataString);

				return true;
			}
		}
		
		
		//manager level searching the employee
		
		 else if (id == "esep_manager_search") {
			var empid=$('#choose').val();
			
			if(empid=="none selected" ){
				alert("Please enter employee id ! ");
				return false;
			} else {
				var url = 'postLoginJsp/e-separation_ELC/manager_serach_based_on_emp.jsp';
				var dataString = '&empid=' +empid ;

				qryPage(url, dataString);
				return true;
			}
		}
		
		
		
		 else if (id == "e-SEP_MAN") {
				 url = "postLoginJsp/e-separation_ELC/e_sep_request_manager.jsp"; 
				/* url = "postLoginJsp/e_sep_Manager/e_sep_mgr_controll.jsp"; */
				dataString = "";
			}
		 else if (id == "e-SEP_MANcontroller") {
				/* url = "postLoginJsp/e-separation_ELC/e_sep_request_manager.jsp"; */
			url = "postLoginJsp/e_sep_Manager/usermanual.jsp"; 
			/* 	url = "postLoginJsp/e_sep_Manager/usermanual_mgr.jsp"; */
				dataString = "";
			}
		
			
			else if (id == "E_SEP_HR") {
				url = "postLoginJsp/e_sep_HR/e_sep_hr_initial_page.jsp";
				dataString = "";
			}
			
			else if (id == "New_Separation_EMP_level") {
				url = "postLoginJsp/e-separation_ELC/separationRequest_new.jsp";
				dataString = "";
			}
		
		
		/* HR DASHBORD AFTER CLICKING ACTION BUTTON IN FULL N FINAL SETTLEMENT  */
		
			 else if (id == "fnf_settlement_action") {
				url = "postLoginJsp/HRController/fullnfinal_hr_action_click_report.jsp";
				dataString = "";
			} 

			 else if (id == "returntoMain_screen") {
				//url = "postLoginJsp/HRController/eSep-FullnFinal_hr.jsp";
				url="postLoginJsp/HRController/full_final_hr_fetching_display.jsp";
				dataString = "";
			}
			else if (id == "fnf_settlement_back") {
			
				var sequence_id=$('#fnf_settlement_back').val();
				
				//url = "postLoginJsp/HRController/eSep-FullnFinal_hr.jsp";
				url="postLoginJsp/HRController/fullnfinal_hr_action_click_report.jsp"; 
				dataString =  '&sequence_id='+sequence_id;
				
				qryPage(url, dataString);
				return true;
			}
			
			 else if (id == "fnfworksheet") {
				 var returntoMain_screen=$('#returntoMain_screen').val();
				// alert("postlogin"+returntoMain_screen);
					
							// var url = 'postLoginJsp/HRController/fnfworksheet_hr.jsp';
							var url = 'postLoginJsp/HRController/worksheet_controller.jsp';
							var dataString =  '&returntoMain_screen='+returntoMain_screen;

							qryPage(url, dataString);
							return true;
					}
		
		
				else if (id == "fnf_settlement_back_sa") {
					
					var sequence_id=$('#fnf_settlement_back_sa').val();
					
					//url = "postLoginJsp/HRController/eSep-FullnFinal_hr.jsp";
					url="postLoginJsp/SA_Dashbord/sa_initialpage.jsp"; 
					dataString =  '&sequence_id='+sequence_id;
					
					qryPage(url, dataString);
					return true;
				}
		
			else if (id == "fnf_settlement_back_ac") {
					var sequence_id=$('#fnf_settlement_back_ac').val();
					
					//url = "postLoginJsp/HRController/eSep-FullnFinal_hr.jsp";
					url="postLoginJsp/Accountant_Dashboard/accountant_initialpage.jsp"; 
					dataString =  '&sequence_id='+sequence_id;
					
					qryPage(url, dataString);
					return true;
				}
		
		else if (id == "PEE_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/policy_on_employement_of_employee.jsp";
			dataString = "";
		} else if (id == "FLT_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/foreign_language_training.jsp";
			dataString = "";
		} else if (id == "ITDC_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/international_talent_develop_certif.jsp";
			dataString = "";
		}

		else if (id == "RERREAP_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/refer_friend.jsp";
			dataString = "";
		} else if (id == "CONPLC_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/confirmation_policy.jsp";
			dataString = "";
		} else if (id == "ATNDLVP_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/attendance_leave_policy.jsp";
			dataString = "";
		} else if (id == "PHPLC_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/phone_policy.jsp";
			dataString = "";
		} else if (id == "DTRVLPLC_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/domestic_travel_policy.jsp";
			dataString = "";
		} else if (id == "OVERTRVLPLC_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/overseas_travel_policy.jsp";
			dataString = "";
		} else if (id == "EMPPARTEVNT_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/emp_participation_events.jsp";
			dataString = "";
		} else if (id == "INFRAEMPP_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/infrastructure_emp_facilities.jsp";
			dataString = "";
		} else if (id == "EHMGMTP_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/emp_health_manage_policy.jsp";
			dataString = "";
		} else if (id == "GUIDEXTCOM_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/guidelines_external_commu.jsp";
			dataString = "";
		} else if (id == "SEPPLC_ELC") {

			url = "postLoginJsp/HR_Policy_Documents_ELC/separatioin_policy.jsp";
			dataString = "";
		}
		
/* 		
		else if(id=="ctype")
			{
			alert("come in Other call");
			
			 var tol = $('#otherA').val();
			alert(tol);
			
			if(tot=="Withdraw");
			{
				alert("Withdraw");
			}
			 
			
			url = "postLoginJsp/HR_Policy_Documents_ELC/separatioin_policy.jsp";
			dataString = "";
			} */
		
		else if(id=="withdraw_emp_level")
		{
			var i=$( "#withdraw_emp_level option:selected" ).text();
			alert(i);
			if(i=="Withdraw"){
				url = "postLoginJsp/e-separation_ELC/emp_withdraw_eseparation.jsp";
			}
			if(i=="Process Overview"){
				url = "postLoginJsp/e-separation_ELC/eSeparation_clearance.jsp";
			}
			if(i=="Display"){
				url = "postLoginJsp/e-separation_ELC/eSeparation_exit_interview.jsp";
			}
		}
		
		/* DUE CLEARANCE MENU */
		
		else if (id == "DUECLEARANCE_ELC") {

			/* url = "postLoginJsp/e-separation_ELC/usermanual.jsp"; */
			url = "postLoginJsp/Due_Clearance/it_support_dueclear_initial.jsp";
			dataString = "";

		}
		
		else if (id == "HELP_DESK_REQ") {

			url = "postLoginJsp/HELP_DESK/help_desk_req_initial.jsp";
			dataString = "";
		}
		

		loadPage(url, dataString);

	}
</script>

<script>
function Approve_regularization(seq_no) {

	//alert(seq_no);
	if (confirm("Are you sure you want to Approve Regularization?")) {
		var url ='postLoginJsp/MANAGERController/regularization_approve.jsp';
		var dataString = "&seq_no=" + seq_no;

	} else {
		return false;
	}

	loadPage(url, dataString);

	return true;
}

</script>

<script>
function Reject_regularization(seq_no) {

	//alert(seq_no);
	if (confirm("Are you sure you want to Reject this Regularization?")) {
		var url ='postLoginJsp/MANAGERController/regularization_reject.jsp';
		var dataString = "&seq_no=" + seq_no;

	} else {
		return false;
	}

	loadPage(url, dataString);

	return true;
}

</script>



<script type="text/javascript">
	function confirm_deletion(sid) {

		//alert(sid);
		if (confirm("Are you sure you want to delete this recored?")) {
			//window.location = "postLoginJsp/ATND/leaveOverviewActionRslt.jsp?sid=" + sid ;
			alert("succesfully deleted record");
			var url = 'postLoginJsp/ATND/leaveOverviewDelete.jsp';
			var dataString = "&sid=" + sid;

		} else {
			return false;
		}

		loadPage(url, dataString);

		return true;
	}

	function confirm_Approval(sid) {

		if (confirm("Are you sure you want to Aprrove this leave?")) {
			//window.location = "postLoginJsp/ATND/leaveOverviewActionRslt.jsp?sid=" + sid ;
			alert("succesfully leave Approved ");
			var url ='postLoginJsp/MANAGERController/leave_aprroaval_reject.jsp';
			var dataString = "&sid=" + sid;

		} else {
			return false;
		}

		loadPage(url, dataString);

		return true;
	}
	
	function confirm_Reject(sid) {

		//alert(sid);
		if (confirm("Are you sure you want to Reject this leave?")) {
			//window.location = "postLoginJsp/ATND/leaveOverviewActionRslt.jsp?sid=" + sid ;
			alert("succesfully leave Rejected :" + sid);
			var url ='postLoginJsp/MANAGERController/leave_reject.jsp';
			var dataString = "&sid=" + sid;
		} else {
			return false;
		}

		loadPage(url, dataString);

		return true;
	}
	/* function parent_disable() {
	if(popupWindow && !popupWindow.closed)
	popupWindow.focus();
	} */
	function child_open(atndId) {

		var sid = atndId;
		/* var sid = $('#sid').val(); */
		//alert('am in openFormEdit========'+sid);
		var tol = $('#tol').val();
		var sd = $('#sd').val();
		var st = $('#st').val();
		var ed = $('#ed').val();
		var et = $('#et').val();
		var np = $('#np').val();
		var ss = $('#ss').val();
		var used = $('#used').val();

		popupWindow = window
				.open('postLoginJsp/ATND/LeaveoverviewEdit.jsp?sid=' + sid
								+ '&tol=' + tol + '&sd=' + sd + '&st=' + st
								+ '&ed=' + ed + '&et=' + et + '&np=' + np
								+ '&ss=' + ss + '&used=' + used,
						"_blank",
						"directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=280,top=200,left=200");

	}
	function parent_disable() {
		if (popupWindow && !popupWindow.closed)
			popupWindow.focus();
	}
	
	
	
	/* CHECKING STATUS BY EMPLOYEE IN ESEPARTION */
	
	function checking_status_esep(sid) {

	//	alert(sid);
		/* if (confirm("Are you sure you want to Reject this leave?")) {
			alert("succesfully leave Rejected :" + sid); */
			var url ='postLoginJsp/Admin_e_separation/check_emp_status.jsp';
			var dataString = "&seq_id=" + sid;

		/* } else {

			return false;
		} */

		loadPage(url, dataString);

		return true;
	}
	
	
	
	
	
	
	
	
	
	
	
	/* EMPLOYEE EDIT BY ADMIN  */
	
	function editFunction(admctrl)
	{
		/* var sid =admctrl; */
		var empid =admctrl;
		var empfn = $('#empfn').val();
		var empln = $('#empln').val();
		var doj = $('#doj').val();
		var dob = $('#dob').val();
		var design = $('#design').val();
		var mailid = $('#mailid').val();
		var rtm = $('#rtm').val();
		var ctc = $('#ctc').val();
		 var status=$('#status').val(); 
		 var remarks = $('#remarks').val();
		/*  var dor=$('#dor').val();  */
		
		 /*  var popupWindow =window.open('postLoginJsp/ADMINController/EmployeeDataEdit.jsp?empid='+empid+'&empfn='+empfn+'&empln='+empln+'&doj='+doj+'&dob='+dob+'&design='+design+'&mailid='+mailid+ '&rtm='+rtm+'&ctc='+ctc,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=280,top=200,left=200"); */
		 var popupWindow =window.open('postLoginJsp/ADMINController/EmployeeDataEdit.jsp?empid='+empid+'&empfn='+empfn+'&empln='+empln+'&doj='+doj+'&dob='+dob+'&design='+design+'&mailid='+mailid+ '&rtm='+rtm+'&ctc='+ctc+ '&status='+status+ '&remarks='+remarks,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=480,top=180,left=200"); 
		}
	
	/* function edithrsep(hrctrl)
	{
	alert("alert");
		//var sid =admctrl; 
		var empid =admctrl;
		var empfn = $('#empfn').val();
		var empln = $('#empln').val();
		var doj = $('#doj').val();
		var dob = $('#dob').val();
		var design = $('#design').val();
		var mailid = $('#mailid').val();
		var rtm = $('#rtm').val();
		var ctc = $('#ctc').val();
		 var status=$('#status').val(); 
		 var remarks = $('#remarks').val();
		//  var dor=$('#dor').val();  
		
		//  var popupWindow =window.open('postLoginJsp/ADMINController/EmployeeDataEdit.jsp?empid='+empid+'&empfn='+empfn+'&empln='+empln+'&doj='+doj+'&dob='+dob+'&design='+design+'&mailid='+mailid+ '&rtm='+rtm+'&ctc='+ctc,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=280,top=200,left=200"); 
		 var popupWindow =window.open('postLoginJsp/ADMINController/EmployeeDataEdit.jsp?empid='+empid+'&empfn='+empfn+'&empln='+empln+'&doj='+doj+'&dob='+dob+'&design='+design+'&mailid='+mailid+ '&rtm='+rtm+'&ctc='+ctc+ '&status='+status+ '&remarks='+remarks,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=480,top=180,left=200"); 
		}
	 */
</script>

<style>
table, th, td {
	border: 1px solid black;
	width:100;
}
</style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>EMPLOYEE SELF SERVICE</title>

<!--=== CSS ===-->

<!-- Bootstrap -->
<link href="bootstrapN/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

<!-- jQuery UI -->
<!--<link href="plugins/jquery-ui/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />-->
<!--[if lt IE 9]>
		<link rel="stylesheet" type="text/css" href="plugins/jquery-ui/jquery.ui.1.10.2.ie.css"/>
	<![endif]-->

<!-- Theme -->
<link href="assets/css/main.css" rel="stylesheet" type="text/css" />
<link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
<link href="assets/css/icons.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="assets/css/fontawesome/font-awesome.min.css">
<!--[if IE 7]>
		<link rel="stylesheet" href="assets/css/fontawesome/font-awesome-ie7.min.css">
	<![endif]-->

<!--[if IE 8]>
		<link href="assets/css/ie8.css" rel="stylesheet" type="text/css" />
	<![endif]-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700'
	rel='stylesheet' type='text/css'>

<!--=== JavaScript ===-->

<script type="text/javascript" src="assets/js/libs/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>

<script type="text/javascript" src="bootstrapN/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/libs/lodash.compat.min.js"></script>

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
		<script src="assets/js/libs/html5shiv.js"></script>
	<![endif]-->

<!-- Smartphone Touch Events -->
<script type="text/javascript"
	src="plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript"
	src="plugins/event.swipe/jquery.event.move.js"></script>
<script type="text/javascript"
	src="plugins/event.swipe/jquery.event.swipe.js"></script>

<!-- General -->
<script type="text/javascript" src="assets/js/libs/breakpoints.js"></script>
<script type="text/javascript" src="plugins/respond/respond.min.js"></script>
<!-- Polyfill for min/max-width CSS3 Media Queries (only for IE8) -->
<script type="text/javascript" src="plugins/cookie/jquery.cookie.min.js"></script>
<script type="text/javascript"
	src="plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript"
	src="plugins/slimscroll/jquery.slimscroll.horizontal.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.slimscroll.min.js"></script>

<!-- Page specific plugins -->
<!-- Charts -->
<!--[if lt IE 9]>
		<script type="text/javascript" src="plugins/flot/excanvas.min.js"></script>
	<![endif]-->
<script type="text/javascript"
	src="plugins/sparkline/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="plugins/flot/jquery.flot.min.js"></script>
<script type="text/javascript"
	src="plugins/flot/jquery.flot.tooltip.min.js"></script>
<script type="text/javascript"
	src="plugins/flot/jquery.flot.resize.min.js"></script>
<script type="text/javascript"
	src="plugins/flot/jquery.flot.time.min.js"></script>
<script type="text/javascript"
	src="plugins/flot/jquery.flot.growraf.min.js"></script>
<script type="text/javascript"
	src="plugins/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

<script type="text/javascript"
	src="plugins/daterangepicker/moment.min.js"></script>
<script type="text/javascript"
	src="plugins/daterangepicker/daterangepicker.js"></script>
<script type="text/javascript"
	src="plugins/blockui/jquery.blockUI.min.js"></script>

<script type="text/javascript"
	src="plugins/fullcalendar/fullcalendar.min.js"></script>

<!-- Noty -->
<script type="text/javascript" src="plugins/noty/jquery.noty.js"></script>
<script type="text/javascript" src="plugins/noty/layouts/top.js"></script>
<script type="text/javascript" src="plugins/noty/themes/default.js"></script>

<!-- Forms -->
<script type="text/javascript"
	src="plugins/uniform/jquery.uniform.min.js"></script>
<script type="text/javascript" src="plugins/select2/select2.min.js"></script>

<!-- App -->
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/plugins.js"></script>
<script type="text/javascript"
	src="assets/js/plugins.form-components.js"></script>

<script>
	$(document).ready(function() {
		"use strict";

		App.init(); // Init layout and core plugins
		Plugins.init(); // Init all plugins
		FormComponents.init(); // Init all form-specific plugins
	});
</script>

<!-- Demo JS -->
<script type="text/javascript" src="assets/js/custom.js"></script>
<script type="text/javascript" src="assets/js/demo/pages_calendar.js"></script>
<script type="text/javascript"
	src="assets/js/demo/charts/chart_filled_blue.js"></script>
<script type="text/javascript"
	src="assets/js/demo/charts/chart_simple.js"></script>
</head>

<body style="height: 0px">

	<!-- Header -->
	<header class="header navbar navbar-fixed-top" role="banner">
		<!-- Top Navigation Bar -->
		<div class="container">

			<!-- Only visible on smartphones, menu toggle -->
			<ul class="nav navbar-nav">
				<li class="nav-toggle"><a href="javascript:void(0);" title=""><i
						class="icon-reorder"></i></a></li>
			</ul>

			<%
				String id1 = (String) session.getAttribute("loginid");
				String names[] = id1.split("\\@");
				String id11 = names[0];
			%>
			<a class="navbar-brand" style="text-decoration: none;">
				<H6>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome &nbsp;&nbsp;<%=id11%></H6>
				<%-- <span class="username"> Welcome &nbsp;&nbsp;<%=id1 %></span> --%>
			</a>

			<!-- Logo -->
			<a class="navbar-brand" style="text-decoration: none;"> <img
				src="images/clocksoftlogo.jpg" alt="logo" style="width: 55px" /> 
				<strong>Nali Clock Software Solutions</strong>
			</a>
			<!-- /logo -->


			<!-- Top Right Menu -->
		<%-- 	<ul class="nav navbar-nav navbar-right">
			
			<li><a href="<s:url action="support"/>"
					style="text-decoration: none; pointer: mouse"> <!--<img alt="" src="assets/img/avatar1_small.jpg" />-->
						<span class="username">Support</span>
				</a></li> --%>
			
			<!-- </ul> -->
			<ul class="nav navbar-nav navbar-right">

				<!-- Project Switcher Button -->

				<!-- User Login Dropdown -->
				<li><a href="<s:url action="home"/>"
					style="text-decoration: none; pointer: mouse"> <!--<img alt="" src="assets/img/avatar1_small.jpg" />-->
						<span class="username">Help</span>
				</a></li>
				<ul class="nav navbar-nav navbar-right">

					<!-- Project Switcher Button -->

					<!-- User Login Dropdown -->
					<li><a href="<s:url action="home"/>"
						style="text-decoration: none; pointer: mouse"> <!--<img alt="" src="assets/img/avatar1_small.jpg" />-->
							<span class="username">Home</span>
					</a></li>


					<ul class="nav navbar-nav navbar-right">

						<!-- Project Switcher Button -->

						<!-- User Login Dropdown -->
						<li><a href="<s:url action="logout"/>"
							style="text-decoration: none; pointer: mouse"> <!--<img alt="" src="assets/img/avatar1_small.jpg" />-->
								<span class="username">Log Off</span>
						</a></li>

						<%--  <li class="dropdown user">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<!--<img alt="" src="assets/img/avatar1_small.jpg" />-->
						<i class="icon-male"></i>
						<%
							String id=(String)session.getAttribute("loginid");
							System.out.println("id===="+id);
						
						%>
						<span class="username"> Welcome &nbsp;&nbsp;<%=id %></span>
						<i class="icon-caret-down small"></i>
					</a>
					<ul class="dropdown-menu">
		 				
						<!-- <li><a href="login.html"><i class="icon-key"></i> Log Out</a></li> -->
						<li><a href="<s:url action="LogoutAction"/>" style="text-decoration:none;pointer:mouse"><i class="icon-key"></i>Log Out</a></li>
					</ul>
				</li> --%>
						<!-- /user login dropdown -->

					</ul>
					<!-- /Top Right Menu -->
		</div>
		<!-- /top navigation bar -->




		<!----------second header------------->

		<!-- Top Navigation Bar -->
		<!--   background:#63A2CF -->
		<div class="container"
			style="background: #DB0404; border-bottom: 2px solid #4D7496;">
			<!-- Top Left Menu -->
			<ul class="nav navbar-nav navbar-left hidden-xs hidden-sm">
				<li>
					<div id="ess" style="cursor: pointer; width: 170px; background-color: #63A2CF; border-left: 0px" class="tab" onClick="changeColor(this.id)">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Employee Self Services</div>
				</li>
				  <li>
					<div id="ms" style="cursor:pointer;width:170px;" class="tab" onClick="changeColor(this.id)">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Manager Self Services
					</div>
				</li> 
				
				<li>
					<div id="ld" style="cursor: pointer; width: 190px;" class="tab" onClick="changeColor(this.id)">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Learning and Development</div>
				</li>
				<li>
					<div id="elc" style="cursor: pointer; width: 170px;" class="tab" onClick="changeColor(this.id)">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Employee life cycle</div>
				</li>

				  <li>
					 <div id="hrd" style="cursor:pointer;width:170px;" class="tab" onClick="changeColor(this.id)">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HR Dashboard
					</div> 
					<%-- <a href="<s:url action="HRDashboard" />" style="text-decoration:none;pointer:mouse;color:white">HR Dashboard</a> --%> 
				</li> 
				
				<li>
					<div id="sad" style="cursor: pointer; width: 231px;" class="tab" onClick="changeColor(this.id)">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sanctioning Authority Dashboard</div>
				</li>
				
				<li>
					<div id="accdash" style="cursor: pointer; width: 231px;" class="tab" onClick="changeColor(this.id)">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Accountant Dashboard</div>
				</li>
				
				<li>
					<div id="admindash" style="cursor: pointer; width: 231px;" class="tab" onClick="changeColor(this.id)">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Admin Dashboard</div>
				</li>
				

				<!--  <li class="dropdown">
					<a href="elc" class="dropdown-toggle" data-toggle="dropdown">
						Employee life cycle
						<i class="icon-caret-down small"></i>
					</a>
					<ul class="dropdown-menu">
					<i class="icon-user"><i class="icon-calendar">
						<li><a href="#cj" id="cj"><i class="icon-tasks"></i>Career and Job</a></li>
						<li><a href="#epms" id="cj"><i class="icon-tasks"></i>ePMS</a></li>
						<li><a href="#esep" id="cj"><i class="icon-tasks"></i>eSeparation</a></li>
						<li><a href="#hrpd" id="#hrpd"><i class="icon-tasks"></i>HR Policy Documents</a></li>
						<li class="divider"></li>
						<li><a href="#"><i class="icon-tasks"></i> Example #3</a></li>
					</ul>
				</li>
			</ul> -->
				<!-- /Top Left Menu -->
		</div>
		<!---------------end second header--------->






		<!---------third header------------->

		<!-- Top Navigation Bar -->
		<div class="container" style="background: #63C0ED">
			<!-- Top Left Menu -->
			<ul class="nav navbar-nav navbar-left hidden-xs hidden-sm">
				<li>
					<%-- <a href="<s:url action="personal_info_menu" />" style="text-decoration:none;pointer:mouse;color:white">PERSONAL INFO</a> --%>
					<%-- <a href="<s:url action="personlaMenuAction" />" style="text-decoration:none;pointer:mouse;color:white">PERSONAL INFO</a> --%>

			 <div id="wtsn" style="cursor: pointer; width: 155px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Whats New&nbsp;&nbsp;</div> 
					<!-- <div id="wtsn" style="cursor: pointer; width: 125px magrgin-left:-2%">&nbsp;Whats New&nbsp;</div> -->
				</li>

			 	<li>
					<div id="whoswho" style="cursor: pointer; width: 156px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Who's Who&nbsp;&nbsp;</div>
				</li> 
				<!-- <li>
					<div id="whoswho" style="cursor: pointer; width: 115px">&nbsp;Who's Who&nbsp;</div>
				</li> -->
				<li>
					<%-- <a href="<s:url action="personal_info_menu" />" style="text-decoration:none;pointer:mouse;color:white">PERSONAL INFO</a> --%>
					<%-- <a href="<s:url action="personlaMenuAction" />" style="text-decoration:none;pointer:mouse;color:white">PERSONAL INFO</a> --%>

 					<div id="info" style="cursor: pointer; width: 156px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Personal
						Information&nbsp;&nbsp;</div> 
						
						<!-- <div id="info" style="cursor: pointer; width: 155px">&nbsp;Personal
						Information&nbsp;</div> -->
				</li>
			<!-- 	 <li>
					<div id="eoff" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Employee offers</div>
				</li>  -->
				
				<li>
					<%-- <a href="<s:url action="attandenceMenuAction" />" style="text-decoration:none;pointer:mouse;color:white">Attendance/Leave</a> --%>
					<div id="atnd" style="cursor: pointer; width: 155px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Attendance/Leave</div>
				</li>

				<li>
					<div id="bpay" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Benefits & Payments</div>
				</li>


				<li class="dropdown">
					<div id="tmgmt" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Travel Managment
						<!-- <i class="icon-caret-down small"></i> -->
					</div> <!-- <ul class="dropdown-menu">
						<li><a href="#"><i class="icon-user"></i> Example #1</a></li>
						<li><a href="#"><i class="icon-calendar"></i> Example #2</a></li>
						<li class="divider"></li>
						<li><a href="#"><i class="icon-tasks"></i> Example #3</a></li>
					</ul> -->
				</li>

				<li>
					<div id="reimb" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reimbursements</div>
				</li>

				<li>
					<div id="ins" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Insurance</div>
				</li>

				<li>
					<div id="rbfs" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Retiral Benifits</div>
				</li>

				<li>
					<div id="ffs" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;F&F Settelement</div>
				</li>

				<li>
					<div id="hrctrl" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HR Controller</div>
				</li>

				<!-- <li>
					<div id="adctrl" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ADMIN Controller</div>
				</li>
				 -->
				<li>
				<div id="mss" style="cursor:pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Manager Self Service</div>
				</li>
				
				<!-- </ul>
				<ul class="nav navbar-nav navbar-left hidden-xs hidden-sm1" > -->


				<li>
					<div id="cnj" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Career and Job</div>
				</li>

				<li>
					<div id="epms" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ePMS</div>
				</li>

				<li>
					<div id="esep" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;eSeparation</div>
				</li>

				<li>
					<div id="hrpd" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HR Policy Documents</div>
				</li>
				
				<li>
					<div id="dueclarance_test" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Due Clearance</div>
				</li>
				
		<!-- for manager self service -->

				<li>
					<div id="wiw" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;who is who</div>
				</li>

				<li>
					<div id="abtatndlv" style="cursor: pointer; width: 190px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;About Attendance/Leave</div>
				</li>
				<li>
					<div id="abtatregu" style="cursor: pointer; width: 190px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Regularization</div>
				</li>

				<li>
					<div id="e-sep_man_post" style="cursor: pointer; width: 190px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e-Separation</div>
				</li>

				<li>
					<div id="e-sep_hr_tab" style="cursor: pointer; width: 190px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e-Separation</div>
				</li>
				
				<li>
					<div id="e-sep_sa_tab" style="cursor: pointer; width: 190px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e-Separation</div>
				</li>
				
				<li>
					<div id="e-sep_acc_tab" style="cursor: pointer; width: 190px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e-Separation</div>
				</li>
				
				<li>
					<div id="hdesk" style="cursor: pointer; width: 155px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Help Desk</div>
				</li>
				
				<li>
					<div id="hdesk_query" style="cursor: pointer; width: 190px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Help Desk Report</div>
				</li>
				
			<!-- FOR DUE CLEARANCE -->
			<!-- 	<li>
					<div id="it_support_team_tab" style="cursor: pointer; width: 190px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Due Clearance</div>
				</li> -->

			</ul>
			<!-- /Top Left Menu -->

		</div>
		<!---------------end Third header--------->

	</header>
	<!-- /.header -->


	<!------new added header-------->

	<!-----end new added header------------->

	<div id="container">
		<!-- Sidebar -->
		<BR>
		<div id="sidebar" class="sidebar-fixed" style="margin-top: 50px">
			<jsp:include page="PI/personalinfo_menu1.jsp"></jsp:include>

		</div>

		<!-- end Sidebar -->
		<!-- body -->
		<div id="content">

			<br>
			<jsp:include page="PI/personalProfile.jsp"></jsp:include>
			<%-- <%
				String empPersonalInfo = EmployeeDetailsPersonal.getPersonalInfo();
				System.out.println("empPersonalInfo11====" + empPersonalInfo);

				String empPersonalInfoAry[] = empPersonalInfo.split("\\^");

				String empId = empPersonalInfoAry[0];
				String empFname = empPersonalInfoAry[1];
				String empLname = empPersonalInfoAry[2];
				String joiningDate = empPersonalInfoAry[3];
				String empDob = empPersonalInfoAry[4];
				String empDesig = empPersonalInfoAry[5];
				String empEmail = empPersonalInfoAry[6];
				String repManager = empPersonalInfoAry[7];
				String empCtc = empPersonalInfoAry[8];
			%>

			<table align="center">
				<tr>
					<col width="130">
					<col width="130">
					<td><b>EMP ID</b></td>
					<td><%=empId%></td>
				</tr>
				<tr>
					<td><b>FIRST NAME</b></td>
					<td><%=empFname%></td>
				</tr>
				<tr>
					<td><b>LAST NAME</b></td>
					<td><%=empLname%></td>
				</tr>
				<tr>
					<td><b>JOINING DATE</b></td>
					<td><%=joiningDate%></td>
				</tr>
				<tr>
					<td><b>DOB </b></td>
					<td><%=empDob%></td>
				</tr>
				<tr>
					<td><b>DESIGNATION</b></td>
					<td><%=empDesig%></td>
				</tr>
				<tr>
					<td><b>EMAIL</b></td>
					<td><%=empEmail%></td>
				</tr>
				<tr>
					<td><b>REPORTING MANAGER</b></td>
					<td><%=repManager%></td>
				</tr>
				<tr>
					<td><b>CTC</b></td>
					<td><%=empCtc%></td>
				</tr>
			</table> --%>

		</div>
		<!-- end body -->
	</div>

</body>
</html>