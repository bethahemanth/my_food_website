<%@ page import="java.sql.*, java.util.*,java.lang.*" %>
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
    String name=request.getParameter("name");
    String review=request.getParameter("review");
    String stars=request.getParameter("stars");
    Connection con=null;
    PreparedStatement ps=null;
    String query="insert into review values(?,?,?)";
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","root");
        ps=con.prepareStatement(query);
        ps.setString(1,name);
        ps.setString(2,review);
        ps.setString(3,stars);
        int i=ps.executeUpdate();
        if(i>0)
        {
            out.print("<p>Data successfully uploaded</p> ");
        }
        else {
            out.print("<p>Error Message</p>");
        }
    }
    catch (Exception e)
    {
        out.print(e);
    }

%>