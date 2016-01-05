<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import=" java.sql.*" %>
<%@page import="java.util.ArrayList"%>

<%@page import="com.ess.common.action.AttendanceDetails"%>
				<%@page import="com.ess.util.GetConnection"%>
				
				<%
				 //ArrayList<String> pHolidaylist = AttendanceDetails.getLeaveDays();
				//out.println("jhsdzf======"+pHolidaylist);
				//String[] abcd=pHolidaylist.split(",");
				
				//String a=(String)request.getParameter("pl");
			String pl=(String)session.getAttribute("pl");
				out.println("=============="+pl);
			%>
			
			
		 <c:set var="dateParts" value="${fn:split(nnn,'.')}" /> 
			<%-- <c:forEach var="splt" items="${fn:split(nnn, ',')}"> --%>
			<c:out value="${dateParts[0]}" /> 
			<!-- out.println("from c======"+dateParts); -->
			
<input type="text" name="PL" value="${dateParts[0]}" />
<input type="text" name="CL" value="${dateParts[1]}" />
<input type="text" name="SL" value="${dateParts[2]}" />
<input type="text" name="OTH" value="${dateParts[3]}" />

				

</body>
</html>