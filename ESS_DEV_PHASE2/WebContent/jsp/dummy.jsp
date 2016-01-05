<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>WEB PAGE TITLE GOES HERE</title>

</head>

<body style="margin: 0px; padding: 0px; font-family: 'Trebuchet MS',verdana;">

<table width="100%" style="height: 100%;" cellpadding="10" cellspacing="0" border="0">
<tr>

<!-- ============ HEADER SECTION ============== -->
<td colspan="2" style="height: 100px;"><%-- <jsp:include page="header.jsp"></jsp:include> --%>
 <div id="header">
    <tiles:insertAttribute name="header" />
</div>
</td></tr>

<tr>
<!-- ============ LEFT COLUMN (MENU) ============== -->
<td width="20%"  style="height:750px;padding-top:15px;" valign="top" bgcolor="#999f8e">
<a href="#">Menu link</a><br>
<a href="#">Menu link</a><br>
<a href="#">Menu link</a><br>
<a href="#">Menu link</a><br>
<a href="#">Menu link</a>
</td>

<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
<td width="80%" style="height: 750px" valign="top" bgcolor="#d2d8c7">

</td></tr>

<!-- ============ FOOTER SECTION ============== -->
<tr><td colspan="2" align="center" height="20" bgcolor="#777d6a">Copyright ©</td></tr>
</table>
</body>

<html>

