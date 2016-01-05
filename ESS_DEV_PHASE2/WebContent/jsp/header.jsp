 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <head>
 <link rel="stylesheet" href="css/menuTemplate4.css">
 </head>
 
 <div style="height:120px;width:1400px;background-color:#008080;margin-left:-1%;margin-bottom:1.2%">
 <!--//////////////////
    // <header1>   //
    ////////////////-->
 
 <div style="width:100%;height:70%;background-color:#327CB8;margin-top:-1%">
<div style="width:100%;height:100%">
<div style="width:60%;height:100%;float:left"><img src="images/clocksoftlogo.jpg" height="100%" width="700px"></div>



<div style="width:40%;height:100%;float:left">
<div style="width:100%;height:100%;float:left">
<div style="width:70%;height:50%;float:left;padding-top:0%;color:AliceBlue;padding-top:2%;padding-left:5%;margin-top:0%">
<b>Welcome <s:property value="#session.loginid" /></b>
<b>

  
</b>
</div>
<div style="width:35%;height:50%;float:left;padding-top:0%;padding-left:8%;color:AliceBlue">
<a href="<s:url action="home" />" style="text-decoration:none;pointer:mouse;color:white"><b>HOME</b></a>
<div style="width:50%;height:50%;float:left;padding-top:0%;padding-right:4%;color:AliceBlue">


<a href="<s:url action="logout" />" style="text-decoration:none;pointer:mouse;color:white"><b>LOGOUT</b></a>



</div>
</div>
</div>
</div>
</div> 









<div style="width:100%:height:0%;background-color:green"></div>
<!--//////////////////
    // <header2>   //
    ////////////////-->

 <div style="width:100%;height:25%;background-color:DarkSalmonDarkSalmon;color:AliceBlue;padding-top:0.3%;padding-bottom:0.5%">
<div style="width:100%;height:100%">

<div style="width:16%;height:100%;float:left;padding-top:0.3%;padding-left:6%;font: bold 12px Arial,Calibri,Verdana,Geneva,sans-serif"><b>EMPLOYEE SELF SERVICE</b></div>
<div style="width:16%;height:100%;float:left;padding-top:0.3%;padding-left:8%;font: bold 12px Arial,Calibri,Verdana,Geneva,sans-serif"><b>MANAGER SELF SERVICE</b></div>
<div style="width:16%;height:100%;float:left;padding-top:0.3%;padding-left:8%;font: bold 12px Arial,Calibri,Verdana,Geneva,sans-serif"><b>EMPLOYEE LIFE CYCLE</b></div>

<div style="width:16%;height:100%;float:left;padding-top:0.3%;padding-left:8%;font: bold 12px Arial,Calibri,Verdana,Geneva,sans-serif">
<%-- <b><a href="<s:url action="Registration" />" style="text-decoration:none;pointer:mouse;color:white">HR DASHBOARD</a></b> --%>
<ul class="menuTemplate4 decor4_1" license="mylicense">
 
    
     <li class="separator"></li>
    <li>
    <a href="<s:url action="Registration" />" style="text-decoration:none;pointer:mouse;color:white">HR DASHBOARD</a>
   
        <div class="drop decor4_2 dropToLeft" style="width: 200px">
            <div class='left'>
                <b>PURE CSS MENU</b>
                <div>
               
                    <a href="<s:url action="Registration" />" style="font-size: 12px;">NEW REGISTRATION</a><br />
                    <a href="jsp/${applicationScope.hashMap['registration']}">REGISTRATION</a><br>
                    <a href="#">See All ...</a>
                </div>
                <b>POPOUT MENU</b>
                <div>
                    <a href="#">Find a location</a><br />
                    <a href="#">Request a test drive</a><br />
                    <a href="#">See All ...</a>
                </div>
            </div>
        </div>
    </li>
</ul>


</div>
<!-- style="text-decoration:none;pointer:mouse;color:white" -->

</div>
</div>
<div style="width:100%:height:0%;background-color:green"></div>










<!-- //////////////////
    // <header3>   //
    
    //////////////// -->

<div style="width:100%;height:20%;background-color:coral;color:AliceBlue;padding-bottom:0.5%" >
<div style="width:100%;height:100%;float:left">

<div style="width:15%;height:100%;float:left;padding-bottom:0.5%;padding-left:1%;font: bold 12px Arial,Calibri,Verdana,Geneva,sans-serif;">
<a href="<s:url action="personal_info_menu" />" style="text-decoration:none;pointer:mouse;color:white">PERSONAL INFO</a><br />

</div>
<div style="width:15%;height:100%;float:left;padding-bottom:0.5%;padding-left:1%;font: bold 12px Arial,Calibri,Verdana,Geneva,sans-serif"><b>EMPLOYEE OFFERS</b></div>
<div style="width:15%;height:100%;float:left;;padding-bottom:0.5%;padding-left:2%;font: bold 12px Arial,Calibri,Verdana,Geneva,sans-serif"><b>
<a href="<s:url action="AttendanceLeaveMain"/>" style="text-decoration:none;pointer:mouse;color:white">ATTENDANCE / LEAVE</a></b></div>
<div style="width:15%;height:100%;float:left;padding-bottom:0.5%;padding-left:3%;font: bold 12px Arial,Calibri,Verdana,Geneva,sans-serif"><b>BENFITS & PAYMENTS</b></div>
<div style="width:20%;height:100%;float:left;padding-bottom:0.5%;padding-left:3%;font: bold 12px Arial,Calibri,Verdana,Geneva,sans-serif"><b>TRAVEL MANAGEMENT</b></div>

</div>
</div>


 

</div> 


 