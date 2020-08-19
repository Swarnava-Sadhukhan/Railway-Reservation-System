<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%
    //if(session.getAttribute("id")!="111111111")
        //response.sendRedirect("index.jsp");

    int train_no = Integer.parseInt(request.getParameter("train_no"));    
    String train_name = request.getParameter("train_name");
    String source = request.getParameter("source");
    String destination = request.getParameter("destination");
    String arrival = request.getParameter("arrival");
    String departure = request.getParameter("departure");
    int ac_seats = Integer.parseInt(request.getParameter("ac_seats"));
    int non_ac_seats = Integer.parseInt(request.getParameter("non_ac_seats"));
    float ac_fare = Float.parseFloat(request.getParameter("ac_fare")); 
    float non_ac_fare = Float.parseFloat(request.getParameter("non_ac_fare")); 
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_database", "root", "root");
    Statement st = con.createStatement();
    
    String query = "SELECT * FROM train WHERE train_no = '"+train_no+"'";
    ResultSet rs;
    rs = st.executeQuery(query);
    PreparedStatement ps = null;

    if(rs.next())
    {
        query = "UPDATE train SET train_name = '" + train_name + "' ,  source = '" + source + "' ,  departure = '" + departure + "' , destination = '" + destination + "' WHERE train_no = '"+train_no+"'";
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
        query = "INSERT INTO train (train_no, train_name, source, departure, destination, arrival) VALUES ('" + train_no + "' , '" + train_name + "' , '" + source + "' , '" + departure + "' , '" + destination + "' , '" + arrival + "')";
        int rs1 = st.executeUpdate(query);

        query = "INSERT INTO passes_through (train_no, station_id) VALUES ('" + train_no + "' , '" + source + "')";
        rs1 = st.executeUpdate(query);

        query = "INSERT INTO passes_through (train_no, station_id) VALUES ('" + train_no + "' , '" + destination + "')";
        rs1 = st.executeUpdate(query);

        SimpleDateFormat sim = new SimpleDateFormat("dd-MM-yyyy"); 
        Calendar calendar = Calendar.getInstance(); 
        
        rs1 = 0;
        for(int i=0; i<30; i++)
        {
            String formattedDate = sim.format(calendar.getTime());
            calendar.add(Calendar.DATE, 1); 
            query = "INSERT INTO current_booking_status (train_no, date, ac_seat, ac_fare, non_ac_seat, non_ac_fare, ac_waitlist, non_ac_waitlist) VALUES ('" + train_no + "' , '" + formattedDate + "' , '" + ac_seats + "' , '" + ac_fare + "' , '" + non_ac_seats + "' , '" + non_ac_fare + "' , '0' , '0' )";
            rs1 = st.executeUpdate(query);
        }
        
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