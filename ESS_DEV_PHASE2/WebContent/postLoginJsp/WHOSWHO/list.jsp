<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.ess.util.GetConnection"%>

   <%
   try{
     String s[]=null;

/*      Class.forName("oracle.jdbc.driver.OracleDriver");
     Connection con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin"); */
     
    // String query="select emp_fname from NCSS_EMP_MASTER_INFO ";
    Connection con = GetConnection.getConnection();
     
    //Statement ps=con.createStatement();
 //  ResultSet rs = ps.executeQuery(query); 
     
     
     Statement st=con.createStatement();
     ResultSet rs = st.executeQuery("select emp_fname from NCSS_EMP_MASTER_INFO");

       List<String> li = new ArrayList<String>();

       while(rs.next())
       {
           li.add(rs.getString(1));
       }

       String[] str = new String[li.size()];
       Iterator<String> it = li.iterator();

       int i = 0;
       while(it.hasNext())
       {
           String p = (String)it.next();
           str[i] = p;
           i++;
       }

    //jQuery related start
       String query = (String)request.getParameter("q");

       int cnt=1;
       for(int j=0;j<str.length;j++)
       {
           if(str[j].toUpperCase().startsWith(query.toUpperCase()))
           {
              out.print(str[j]+"\n");
              if(cnt>=5)// 5=How many results have to show while we are typing(auto suggestions)
              break;
              cnt++;
            }
       }
    //jQuery related end

rs.close();
st.close();
con.close();

}
catch(Exception e){
e.printStackTrace();
}

//www.java4s.com
%>