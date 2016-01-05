    <%@page import="com.ess.util.GetConnection"%>
    <%@ page import="java.lang.*,java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<script>
// JS code 
myApp = angular.module('myApp',[]);
<%@ page import = "java.sql.*" %> 
<% 
Connection con = GetConnection.getConnection();

// Class.forName("oracle.jdbc.driver.OracleDriver");
// Connection conn = DriverManager.getConnection ("jdbc:oracle:thin:@192.168.0.109:1521:orcl","HR","HR");
 Statement stmt = con.createStatement();
 /* String sql="select a.emp_code,ProperCase(a.emp_name) emp_name,to_char(to_date(b.pay_month_year,'mm/rrrr'),'Month RRRR') pay_month_year,b.gross_pay, " + 
    "sum(b.gross_pay) over (partition by b.pay_month_Year) tot_pay " +
    "from employee_master a inner join employee_salary b on b.emp_id = a.emp_id and b.pay_month_year='01/2009' and a.emp_grade='S'";
  */
 String sql="select emp_id,emp_fname,emp_ctc from ncss_emp_master_info";
 ResultSet rs = stmt.executeQuery(sql);
 try
 {
  if(rs!=null)
  {
%> 
// JS code 
myApp.controller('empCtl',function($scope) 
   {
    $scope.empData = [
<%
    rs.next();
    while(true)
    {
%> 
     {"emp_code":"<%=rs.getString("emp_id")%>","emp_name":"<%=rs.getString("emp_fname")%>","pay_month_year":"<%=rs.getString("emp_ctc")%>"}
   
     <%if(rs.next()) {%> , <% } else break;
    }
   } 
  }
 catch(SQLException e) 
 {
  e.printStackTrace();
 }
 stmt.close();
 rs.close();
 con.close();
 stmt=null;
 rs=null;
 con=null;
%>
         ];
 $scope.sortField='emp_name';
 $scope.reverse=true;
}); 
</script>
</head>
<body ng-controller="empCtl">
 Employee Search: <input ng-model="query" type="text" />
<table border=1 cellpadding=5>
 <tr>
  <th><a href="" ng-click="sortField = 'emp_code'; reverse=!reverse">Emp Code</a></th>
  <th><a href="" ng-click="sortField = 'emp_name' reverse=!reverse">Emp Name</a></th>
  <th>CTC</th><!-- <th>Gross Pay</th><th>Tot Pay</th> --></tr> 
  <tr ng-repeat="emp in empData | filter:query | orderBy:sortField:reverse">
  
  <td>{{emp.emp_code}}</td>
  <td>{{emp.emp_name}}</td>
  <td>{{emp.pay_month_year}}</td>
  <!-- <td>{{emp.gross_pay}}</td>
  <td>{{emp.tot_pay}}</td>  -->
 </tr>
</table>
</body>
</html>