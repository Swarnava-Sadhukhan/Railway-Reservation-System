<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%
    //if(session.getAttribute("id")!="111111111")
        //response.sendRedirect("index.jsp");

    String user_id = session.getAttribute("user_id");
    int train_no = Integer.parseInt(request.getParameter("train_no"));    
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    String date = request.getParameter("date");
    String class = request.getParameter("class");
    int no_of_passengers = Integer.parseInt(request.getParameter("no_of_passengers"));
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_database", "root", "");
    Statement st = con.createStatement();
    
    String query = "SELECT * from curr_booking_status WHERE train_no = '" + train_no + "' and date = '" + date + "'";
    ResultSet rs, rs1;
    rs = st.executeQuery(query);

    if(rs.next())
    {
        if(class.equalsIgnoreCase("AC"))
        {
            int av_seats = Integer.parseInt(rs.getString("ac_seat");
            float fare = Float.parseFloat(rs.getString("ac_fare"));
        }
        else
        {
            int av_seats = Integer.parseInt(rs.getString("non_ac_seat");  
            float fare = Float.parseFloat(rs.getString("non_ac_fare"));
        }

        if(av_seats>no_of_passengers)
        {
            query = "Insert INTO ticket (user_id, fare, train_no, journey_date) VALUES ('"+user_id+ "','" + fare + "','" +train_no+"','" +date+"')";
            rs1 = st.executeQuery(query);
            if(class.equalsIgnoreCase("AC"))
            {
                query = "UPDATE curr_booking_status SET ac_seat = '"+(av_seat-no_of_passengers)+"' WHERE train_no='"+train_no+"' and date='"+date+"'";    
            }
            else
            {
                query = "UPDATE curr_booking_status SET non_ac_seat = '"+(av_seat-no_of_passengers)+"' WHERE train_no='"+train_no+"' and date='"+date+"'";
            }
            rs1 = st.executeQuery(query);
            out.println("Update Successful.");
%>  
            <a href="post_admin_login.jsp">Return.</a>
<%
        }
        else
        {
            out.println("Booking Unsuccessful. Not enough seats.");
%>
            <a href="post_admin_login.jsp">Return.</a>
<%
        }
    }
%>