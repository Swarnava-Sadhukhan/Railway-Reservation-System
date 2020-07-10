<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%
    String user_id = request.getParameter("user_id");
    String email = request.getParameter("user_id"); 
    String first_name = request.getParameter("first_name");  
    String middle_name = request.getParameter("middle_name");  
    String last_name = request.getParameter("last_name"); 
    String password = request.getParameter("password");
    String dob = request.getParameter("dob"); 
    String gender = request.getParameter("gender"); 
    String city = request.getParameter("city"); 
    long contact = Long.parseLong(request.getParameter("contact"));
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_database", "root", "root");
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("select * from user where user_id='" + user_id + "'");
        if (rs.next()) 
        {
            out.println("ID already exists");
            //response.sendRedirect("index.jsp");
        } 
        else 
        {
            try
            {
                String query = "insert into user (user_id, first_name, middle_name, last_name, dob, gender, email, password, city, contact) values ('" + user_id + "' , '"  + first_name + "' , '" + middle_name + "' , '" + last_name + "','" + dob + "', '" + gender + "', '" + email + "', '" + password + "', '" + city + "','" + contact + "') ";
                int rs1 = st.executeUpdate(query);
                session.setAttribute("user_id",user_id);
                //response.sendRedirect("home.jsp");
            }
            catch(Exception e1)
            {
                out.println(e1.getMessage());
            }
            
        }
    }
    catch(Exception e)
    {
        System.out.println(e.getMessage());
    }
%>