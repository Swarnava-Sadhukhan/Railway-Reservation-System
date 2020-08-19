<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%
    //if(session.getAttribute("id")!="111111111")
        //response.sendRedirect("index.jsp");

    String station_name = request.getParameter("station_name");    
    String station_id = request.getParameter("station_id");

    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_database", "root", "root");
    Statement st = con.createStatement();
    
    String query = "INSERT INTO station (station_id, station_name) VALUES ('" + station_id + "' , '" + station_name + "')";
    int rs = st.executeUpdate(query);

    if(rs>0)
    {
        out.println("Successfully Saved.");
%>  
            <a href="post_admin_login.jsp">Return.</a>
<%
    }
    else
    {
        out.println("Save Unsuccessful.");
%>  
        <a href="post_admin_login.jsp">Return.</a>
<%
    }
%>