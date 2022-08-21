<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
    </body>
</html>
<%

    try
    {
        long custID = 174901000000000L;
        String custName = "",custAccType= "",custAdd= "",custGender= "",custEmail= "",custBalance= "",custPhne="",pswd="",pswd1="";
        custName = request.getParameter("name");
        custAccType = request.getParameter("actype");
        custAdd = request.getParameter("addrs");
        custGender = request.getParameter("gen");
        custEmail = request.getParameter("mail");
        custBalance = request.getParameter("bal").toString();
        custPhne = request.getParameter("phne").toString();
        pswd = request.getParameter("pass1");
//        pswd1 = request.getParameter("pass2");
        String databaseName = "bankDB";
        String user = "root";
        String password = "bharathi18";
        String className = "com.mysql.jdbc.Driver";
        Connection con = null;
        String connection = "jdbc:mysql://localhost:3306/"+databaseName;
        Class.forName(className);
        con = (Connection) DriverManager.getConnection(connection,user,password);
        Statement s =con.createStatement(); 
        ResultSet rs = s.executeQuery("select count(*) as cnt from customerdetails");
        rs.next();
        int cnt = rs.getInt("cnt");
        custID += cnt;
        PreparedStatement p = con.prepareStatement("insert into customerdetails values(?,?,?,?,?,?,?,?,?)");
        p.setLong(1,custID);
        p.setString(2,custName);
        p.setString(3,custAccType);
        p.setString(4,custBalance);
        p.setString(5,custPhne);
        p.setString(6,custAdd);
        p.setString(7,custGender);
        p.setString(8,custEmail);
        p.setString(9,pswd);
        p.executeUpdate();
        String tbleName = "trns"+custID;
        String tble = "create table " + tbleName +"(custid varchar(15),cust_name varchar(50),type varchar(10),amount varchar(15),balance varchar(20),description varchar(100),mode varchar(20) ,transactionID varchar(15))";
        p = con.prepareStatement(tble);
        p.executeUpdate();
    }
    catch(Exception e)
    {
                
    }


%>