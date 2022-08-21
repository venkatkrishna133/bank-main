<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deposit</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
    </body>
</html>
<%
    try
    {
        String id = request.getParameter("id1").toString();
        String pass = request.getParameter("pass");
        String amount = request.getParameter("amnt").toString();
        String id1 = request.getParameter("id2").toString();
        String desc = request.getParameter("desc");
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
        String query1 = "select * from customerdetails where cust_id = "+id1;
        Statement s = con.createStatement();
        ResultSet rs = s.executeQuery(query);
        int i = 0;
        int j = 0;
        String p = "";
        String pswd = "";
        String balance = "";
        String balance1 = "";
        String name = "";
        String name1 = "";
        while(rs.next())
        {
            i++;
            pswd = rs.getString(9).toString();
            balance = rs.getString(4);
            name = rs.getString("cust_name");
        }
        ResultSet rs1 = s.executeQuery(query1);
        while(rs1.next())
        {
            j++;
            balance1 = rs1.getString(4);
            name1 = rs1.getString("cust_name");
        }
        
        if(i!=0 && j!=0)
        {
            if(pass.equals(pswd))
            {
                double blnce = Double.parseDouble(balance);
                double amnt = Double.parseDouble(amount);
                double blnce1 = Double.parseDouble(balance1);
                blnce -= amnt;
                if(blnce > 1000)
                {
                    query = "update customerdetails set cust_balance = "+blnce+" where cust_id = "+id;
                    s.executeUpdate(query);
                    blnce1+=amnt;
                    query = "update customerdetails set cust_balance = "+blnce1+" where cust_id = "+id1;
                    s.executeUpdate(query);
                    query = "insert into trns"+id+" values("+id+",'"+name+"','debit',"+amount+","+blnce+",'"+desc+"','transferred to',"+id1+")";
                    s.executeUpdate(query);
                    query = "insert into trns"+id1+" values("+id1+",'"+name1+"','credit',"+amount+","+blnce1+",'"+desc+"','transferred from',"+id+")";
                    s.executeUpdate(query);                
                    p = "<h1 id = "+'"'+"depbalance"+'"'+"> BALANCE : <b style="+'"'+"font-size:50px;color:red"+'"'+">"+blnce+" </b></h1>";
                }
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
