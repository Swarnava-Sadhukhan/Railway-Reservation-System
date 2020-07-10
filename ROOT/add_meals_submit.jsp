<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%
    //if(session.getAttribute("id")!="111111111")
        //response.sendRedirect("index.jsp");

    int train_no = Integer.parseInt(request.getParameter("train_no"));    
    String meal_id = request.getParameter("meal_id");
    float price = Float.parseFloat(request.getParameter("price"));
    String type = request.getParameter("type");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_database", "root", "root");
    Statement st = con.createStatement();
    
    String query = "SELECT * FROM meals WHERE meal_id = '"+meal_id+"'";
    ResultSet rs;
    rs = st.executeQuery(query);
    PreparedStatement ps = null;

    if(rs.next())
    {
        query = "UPDATE meals SET train_no = '" + train_no + "' ,  Price = '" + price + "' ,  Type = '" + type + "'";
        int i = st.executeUpdate(query);

        if(i>0)
        {
            out.println("Update Successful.");
%>  
            <a href="post_admin_login.jsp">Return.</a>
<%
        }
        else
        {
            out.println("Update Unsuccessful.");
%>
            <a href="post_admin_login.jsp">Return.</a>
<%
        }
    }
    else
    {
        query = "INSERT INTO meals (train_no, meal_id, price, type) VALUES ('" + train_no + "' , '" + meal_id + "' , '" + price + "' , '" + type + "')";
        int rs1 = st.executeUpdate(query);
        
        if(rs1>0)
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
    }
%>