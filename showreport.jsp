<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction Report</title>
         <link rel="stylesheet" href="jspstyle.css">
    </head>
    <body>
    </body>
</html>

<%
    try
    {
        String t = "\"bharathi\"";
        String temp = "<html><body>";
        out.println(temp);
        String tempnav = "<nav class="+'"'+"nav-bar"+'"'+">";
        String tempnav1 = "<img id="+'"'+"logo"+'"'+" src="+'"'+"./images/The_World_Bank_logo.png"+'"'+" alt="+'"'+'"'+" width="+'"'+"100"+'"'+"height="+'"'+"90"+'"'+"s/>";
        String tempnav2 = "<h1 id="+'"'+"bankname"+'"'+"> Bharath Bank</h1></nav>";
        out.println(tempnav);
        out.println(tempnav1);
        out.println(tempnav2);
        String id = request.getParameter("id").toString();
        String pass = request.getParameter("pass");
//        String s = "<p id=\"demo\">JavaScript can change HTML content.</p><button type=\"button\"onclick='document.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\">Click Me!</button>";

        String custdet ="<h1 id = \"custdet\">CUSTOMER DETAILS</h1><br><br><br><br>";
        out.println(custdet);
        String databaseName = "bankDB";
        String user = "root";
        String password = "bharathi18";
        String className = "com.mysql.jdbc.Driver";
        Connection con = null;
        String connection = "jdbc:mysql://localhost:3306/"+databaseName;
        Class.forName(className);
        con = (Connection) DriverManager.getConnection(connection,user,password);
        String query = "select * from trns"+id;
        Statement s = con.createStatement();
        ResultSet rs = s.executeQuery(query);
        out.println("<div class=\"listable\">");
        out.println("<P ALIGN='center'><TABLE id = \"bank\" BORDER=1>");
        int rowCount = 0;
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();
 // table header
        out.println("<TR>");
        for (int i = 0; i < columnCount; i++) {
            out.println("<TH>" + rsmd.getColumnLabel(i + 1) + "</TH>");
        }
       out.println("</TR>");
 // the data
        while (rs.next()) {
            rowCount++;
            out.println("<TR>");
            for (int i = 0; i < columnCount; i++) {
                out.println("<TD>" + rs.getString(i + 1) + "</TD>");
            }
            out.println("</TR>");
        }
        out.println("</TABLE></P>");
        out.println("</div>");
    }
    catch(Exception e)
    {
        out.println("<html><body><h1>"+e+"</h1></body></html>");
    }
    out.println("</body></html>");
    
%>
