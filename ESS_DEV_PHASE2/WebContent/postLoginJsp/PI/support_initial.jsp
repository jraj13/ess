
<%
	String uName = (String) session.getAttribute("loginid");
String empid=(String)session.getAttribute("empid");
	String rolename = (String) session.getAttribute("rolesession");

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
			type : 'POST',
			data : dataString,
			datatype : 'json',
			success : function(data) {
				$('#content').html(data)

			},
			error : function(jqXHR, textStatus, errorThrown) {

			}
		});

	}
function qryPage(url, dataString) {

	$('#qrySuccess').html('<img src="images/loading.gif">');
	$.ajax({
		url : url,
		type : 'POST',
		data : dataString,
		datatype : 'json',
		success : function(data) {

			$('#qrySuccess').html(data)
		},
		error : function(jqXHR, textStatus, errorThrown) {

		}
	});

}


function atndQryRslt(id) {

	//alert("Am In Btn Click");

	$('#qryload').html('<img src="images/loading.gif" >');
	$.ajax({
		url : 'url',
		type : 'POST',
		data : dataString,
		datatype : 'json',
		success : function(data) {

			$('#qryload').html(data)

		},
		error : function(jqXHR, textStatus, errorThrown) {

		}
	});

}


	$(function() {	
		
 var uName='<%=uName%>';
 var rolename='<%=rolename%>';

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

				$('#sidebar').load('postLoginJsp/PI/personalinfo_menu1.jsp');
				loadPage('postLoginJsp/PI/personalProfile.jsp', '');
			})

		} 
		
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

		else {

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

		})
		
		$("#atnd").click(function() {
		//			alert("Am frm atnd");
			$('#sidebar').load('postLoginJsp/ATND/atnd_menu.jsp');
			loadPage('postLoginJsp/ATND/worktime.jsp', '');

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

			$('#sidebar').load('postLoginJsp/PI/employeeoffer_menu.jsp');
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

			$('#sidebar').load('postLoginJsp/PI/employeeoffer_menu.jsp');
			loadPage('postLoginJsp/PI/empLifeCycle.jsp', '');
				
				})
				
				$("#e-sep_acc_tab").click(function() {
					$('#sidebar').load('postLoginJsp/Accountant_Dashboard/e_sep_account_menu.jsp');
					loadPage('postLoginJsp/HRController/createemp.jsp', '');
				})

	
	})

	
	
		

	function openPage(id) {

		//alert(id);

		var url, dataString;

		if (id == "WHATSNEW") {

			url = "postLoginJsp/PI/whatnew.jsp";
			dataString = "";

		} 
		
		/* DUE CLEARANCE MENU */
		
		else if (id == "DUECLEARANCE_ELC") {

			/* url = "postLoginJsp/e-separation_ELC/usermanual.jsp"; */
			url = "postLoginJsp/Due_Clearance/it_support_dueclear_initial.jsp";
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
	
	<style type="text/css">
	table, th, td {
    border: 0px solid black;
    width: 100;
}
	
	</style>
	
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
				src="images/clocksoftlogo.jpg" alt="logo" style="width: 55px" /> <strong>Nali
					Clock software Solutions</strong>
			</a>
			<!-- /logo -->


			<!-- Top Right Menu -->
			<ul class="nav navbar-nav navbar-right">
			
			<li><a href="<s:url action="support"/>"
					style="text-decoration: none; pointer: mouse"> <!--<img alt="" src="assets/img/avatar1_small.jpg" />-->
						<span class="username">Support</span>
				</a></li>
			
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
		<%-- 		<li>
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
					<a href="<s:url action="HRDashboard" />" style="text-decoration:none;pointer:mouse;color:white">HR Dashboard</a> 
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
				 --%>

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

<%-- 			 <div id="wtsn" style="cursor: pointer; width: 155px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Whats New&nbsp;&nbsp;</div> 
					<!-- <div id="wtsn" style="cursor: pointer; width: 125px magrgin-left:-2%">&nbsp;Whats New&nbsp;</div> -->
				</li>

			 	<li>
					<div id="whoswho" style="cursor: pointer; width: 156px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Who's Who&nbsp;&nbsp;</div>
				</li> 
				<!-- <li>
					<div id="whoswho" style="cursor: pointer; width: 115px">&nbsp;Who's Who&nbsp;</div>
				</li> -->
				<li>
					<a href="<s:url action="personal_info_menu" />" style="text-decoration:none;pointer:mouse;color:white">PERSONAL INFO</a>
					<a href="<s:url action="personlaMenuAction" />" style="text-decoration:none;pointer:mouse;color:white">PERSONAL INFO</a>

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
					<a href="<s:url action="attandenceMenuAction" />" style="text-decoration:none;pointer:mouse;color:white">Attendance/Leave</a>
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
				</li> --%>
				
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
		
		<div id="sidebar" class="sidebar-fixed" style="margin-top: 50px">
	<jsp:include page="employeeoffer_menu.jsp"></jsp:include> 
		</div>

		<!-- end Sidebar -->
		<!-- body -->
		<div id="content">

			<%-- <jsp:include page="support.jsp"></jsp:include> --%>
			<s:div><b>Help Desk</b></s:div>
 <hr>
 <s:form action="helpdesk" method="post">
   <label>Category</label>&nbsp;
   <select name="hdCategory">
   <option value="Employee Information">Employee Information</option>
   <option value="Payslip">Payslip</option>
   <option value="Income Tax">Income Tax</option>
   <option value="Attendance/Leave">Attendance/Leave</option>
   <option value="Travel Management">Travel Management</option>
   <option value="F and F settlement">F and F settlement</option>
   <option value="Others">Others</option>
   </select> 
   <br>
    <label>Query</label>&nbsp;
    <textarea rows="5" cols="80" name="hdQuery"></textarea>
    <br>
    
     <label>Attachment</label>&nbsp;
    <input type="file" name="hdAttachment" >
    <br><br>
    <input type="hidden" name="mailid" value="<%=uName %>">
    <input type="hidden" name="empid" value="<%=empid %>">
    <input type="submit" value="Submit" >&nbsp;<input type="submit" value="Cancel">
   
   
   </s:form>
   
	 <%--  <s:form action="support" method="post" enctype="multipart/form-data">
  <tr><td colspan="2">   <s:select name="Category" label="Category" 
         list="{'Employee Information','Payslip','Income Tax','Attendance/Leave','Travel Management','F and F settlement','Others'}" ></s:select>
         </td>
   <tr><td colspan="2">
   <s:textarea key="Query" name="email.body" rows="10" cols="50" /></td></tr>
  <tr><td colspan="2"> <s:label for="attachment" value="Attachment"/>
   <s:file name="attachment" accept="text/html,text/plain" /></td></tr>
   <s:token />
	
    <s:div align="left"> <s:submit key="Submit" value="Submit" />
    <s:submit key="Cancel" value="Cancel" /></s:div>
   </s:form> --%>
			

		</div>
		<!-- end body -->
	</div>

</body>
</html>