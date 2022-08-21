<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Balance</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
    </body>
</html>
<%
    try
    {
        String id = request.getParameter("id").toString();
        String pass = request.getParameter("pass");
//        String s = "<p id=\"demo\">JavaScript can change HTML content.</p><button type=\"button\"onclick='document.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\">Click Me!</button>";
        String temp = "<html><body>";
        out.println(temp);
        String tempnav = "<nav class="+'"'+"nav-bar"+'"'+">";
        String tempnav1 = "<img id="+'"'+"logo"+'"'+" src="+'"'+"./images/The_World_Bank_logo.png"+'"'+" alt="+'"'+'"'+" width="+'"'+"100"+'"'+"height="+'"'+"90"+'"'+"s/>";
        String tempnav2 = "<h1 id="+'"'+"bankname"+'"'+"> Bharath Bank</h1></nav>";
        out.println(tempnav);
        out.println(tempnav1);
        out.println(tempnav2);
        String balhead = "<h1 id = "+'"'+"det"+'"'+"> BALANCE DETAILS</h1><br><br><br><br>";
        out.println(balhead);
        String databaseName = "bankDB";
        String user = "root";
        String password = "bharathi18";
        String className = "com.mysql.jdbc.Driver";
        Connection con = null;
        String connection = "jdbc:mysql://localhost:3306/"+databaseName;
        Class.forName(className);
        con = (Connection) DriverManager.getConnection(connection,user,password);
        String query = "select * from customerdetails where cust_id = "+id;
        Statement s = con.createStatement();
        ResultSet rs = s.executeQuery(query);
        int i = 0;
        String p = "";
        String pswd = "";
        String balance = "";
        while(rs.next())
        {
            i++;
            pswd = rs.getString(9).toString();
            balance = rs.getString(4);
        }
        if(i!=0)
        {
            if(pass.equals(pswd))
            {
                p = "<h1 id = "+'"'+"balance"+'"'+"> YOUR BALANCE : <b style="+'"'+"font-size:50px;color:red"+'"'+">"+balance+" </b></h1>";
            }
            else
            {
                p = "<h1 id="+'"'+"det"+'"'+" > Password Incorrect</h1>";
            }
        }
        else
            p = "<h1 id="+'"'+"det1"+'"'+" > CUSTOMER ID NOT FOUND</h1>";
        out.println(p);
       
    }
    catch(Exception e)
    {
        out.println("<h1>"+e+"</h1>");
    }
    out.println("</body></html>");

%>