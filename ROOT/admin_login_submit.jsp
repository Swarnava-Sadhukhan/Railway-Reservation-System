<%@ page import ="java.sql.*" %>
<%
    String admin_id = request.getParameter("user_id");   
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_database", "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from admin where email_id='" + admin_id + "' and password='" + password + "'");
    if (rs.next()) 
    {
        session.setAttribute("user_id", admin_id);
        response.sendRedirect("post_admin_login.jsp");
    } 
    else 
    {
		ResultSet rs1;
		rs1 = st.executeQuery("select * from user where user_id='" + admin_id + "' and password='" + password + "'");
		if (rs1.next()) 
		{
			session.setAttribute("user_id", admin_id);
			session.setAttribute("name",rs1.getString(2)+" "+rs1.getString(4));
			response.sendRedirect("home.jsp");
		}
		else
			out.println("Invalid password <a href='index.html'>Try again</a>");
    }
%>