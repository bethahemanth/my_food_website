<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*,java.lang.*" %>
<script>
    function showAlert() {

        alert("Invalid credentials" );
        window.location.href = "registration_form.html";
    }
</script>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/db";
    String dbUser = "root";
    String dbPassword = "root";

    Connection connection = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        out.println("Connected successfully!");

    } catch (Exception e) {
        e.printStackTrace();
        e.getMessage();
    }
%>
<%
    String user=request.getParameter("user");
    String pass=request.getParameter("pass");
    Connection con=null;
    PreparedStatement ps=null;
    String query= "SELECT * FROM registration_form WHERE username=? AND pass=?";
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","root");
        ps=con.prepareStatement(query);
        ps.setString(1,user);
        ps.setString(2,pass);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            response.sendRedirect("food_order.html");
        } else {

            out.println("<script>showAlert();</script>");
        }
    }
    catch (Exception e)
    {
        out.print(e);
    }

%>