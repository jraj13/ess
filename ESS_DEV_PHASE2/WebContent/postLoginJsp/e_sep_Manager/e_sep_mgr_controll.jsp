<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.lang.*,java.util.*"%>

<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title></title>
 <!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <script>
  $(function() {
    $( "#accordion1" ).accordion();
  });
  </script>
  
  <style>
  .ui-accordion .ui-accordion-content {
    padding: 0em 0.1em;
    border-top: 0;
    overflow: auto;
    width: 278px;
    background-color: white;
    color: white;
}
</style>
</head>
<body>
<div id="accordion1">
  <h3>Separation Details</h3>
  <div>
    <p>
   <!--  Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
    ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
    amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
    odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate. -->
   <%--  <jsp:include page="postLoginJsp/e_sep_Manager/e_sep_request_manager.jsp"></jsp:include> --%>
   
   <div style="background-color: #B0C4DE; margin-top: 5px; margin-left: -3.5%; padding-left: 15px; width: 94%">
		<b>Separation Details</b>
</div>

<label>Select Employee Id : </label>
<select id="choose" class="abc" >
							<option  value="none selected">Select Id </option>
							<% 
							System.out.println("e_sep_request_manager.jsp");  
Connection con=null;
String RegQry="select emp_id  from E_SEPARATION_EMP where  RM_APPROVE='Pending' and EMP_APPROVEL='Initiate' and HR_APPROVE='Pending' and ADMIN_APPROVE='Pending'";
try
{
	 con = GetConnection.getConnection();
		Statement st = con.createStatement();

		ResultSet rs = st.executeQuery(RegQry);

     while(rs.next())
     {
          String name = rs.getString("emp_id");
%>
          <option  value="<%=name%>"><%=name%></option>
<%
     }
}catch(Exception e)
{    out.print(e);
}
%>
</select>

<input type="button" id="esep_manager_search" class="btn btn-default btn-sm" value="Search" onclick="openPage(id)"></input>


<div id="qrySuccess">

</div>
    </p>
  </div>
  <h3>Approval</h3>
  <div>
    <p>
    Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet
    purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor
    velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In
    suscipit faucibus urna.
    </p>
  </div>
  <h3>Employee Details</h3>
  <div>
    <p>
    Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
    Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
    ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
    lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
    </p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>
  <h3>Notes/Remarks</h3>
  <div>
    <p>
    Cras dictum. Pellentesque habitant morbi tristique senectus et netus
    et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
    faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
    mauris vel est.
    </p>
   
  </div>
   <h3>Attachments</h3>
  <div>
    <p>
    Cras dictum. Pellentesque habitant morbi tristique senectus et netus
    et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
    faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
    mauris vel est.
    </p>
   
  </div>
</div>
 
 
</body>
</html>