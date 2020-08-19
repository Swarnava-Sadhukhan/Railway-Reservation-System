<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%
    //if(session.getAttribute("id")!="111111111")
        //response.sendRedirect("index.jsp");

    int train_no = Integer.parseInt(request.getParameter("train_no"));    
    String station_id = request.getParameter("station_id");

    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_database", "root", "root");
    Statement st = con.createStatement();
    
    String query = "INSERT INTO passes_through (train_no, station_id) VALUES ('" + train_no + "' , '" + station_id + "')";
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