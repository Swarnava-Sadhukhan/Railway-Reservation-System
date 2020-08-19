<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%
    //if(session.getAttribute("id")!="111111111")
        //response.sendRedirect("index.jsp");

    String user_id = (String)session.getAttribute("user_id");
    int train_no = Integer.parseInt(request.getParameter("train_no"));    
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    String date = request.getParameter("date");
    String clas = request.getParameter("class");
    int no_of_passengers = Integer.parseInt(request.getParameter("no_of_passengers"));
    
    String p = request.getParameter("p");
    String q = request.getParameter("q");
    String r = request.getParameter("r");
	String s = request.getParameter("s");
    String name[] = new String[6];
    String age[] = new String[6];
    String gender[] = new String[6];
	String meal[] = new String[6];
    int count=1, start=0;
    float fare=0.0f;
    int av_seats=0;
    
    for(int i=0; i<p.length() && count<=6; i++)
    {
        if(p.charAt(i)==',')
        {
            name[count-1] = p.substring(start, i);
            start = i+1;
            count++;
        }
    }
    count=1; start=0;
    for(int i=0; i<q.length() && count<=6; i++)
    {
        if(q.charAt(i)==',')
        {
            age[count-1] =(q.substring(start, i));
            start = i+1;
            count++;
        }
    }
    count=1; start=0;
	String ab="";
    for(int i=0; i<r.length() && count<=6; i++)
    {
        if(r.charAt(i)==',')
        {
            gender[count-1] = r.substring(start, i);
            start = i+1;
            count++;
        }
    }
	count=1; start=0;
    for(int i=0; i<s.length() && count<=6; i++)
    {
        if(s.charAt(i)==',')
        {
			meal[count-1] = s.substring(start, i);
            start = i+1;
            count++;
        }
    }

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_database", "root", "");
    Statement st = con.createStatement();
    
    String query = "SELECT * from current_booking_status WHERE train_no = '" + train_no + "' and date = '" + date + "'";
    ResultSet rs;
    int rs1;
    rs = st.executeQuery(query);
	int x;

    if(rs.next())
    {
        if(clas.equalsIgnoreCase("AC"))
        {
            av_seats = Integer.parseInt(rs.getString("ac_seat"));
            fare = Float.parseFloat(rs.getString("ac_fare"));
			x=Integer.parseInt(rs.getString("ac_waitlist"));
        }
        else
        {
            av_seats = Integer.parseInt(rs.getString("non_ac_seat"));  
            fare = Float.parseFloat(rs.getString("non_ac_fare"));
			x=Integer.parseInt(rs.getString("non_ac_waitlist"));
        }

        if(av_seats>=no_of_passengers)
        {
            
            query = "Insert INTO ticket (user_id, fare, train_no, journey_date) VALUES ('"+user_id+ "','" + fare + "','" +train_no+"','" +date+"')";
            rs1 = st.executeUpdate(query);
            if(clas.equalsIgnoreCase("AC"))
            {
                query = "UPDATE current_booking_status SET ac_seat = '"+(av_seats-no_of_passengers)+"' WHERE train_no = '"+train_no+"' and date = '"+date+"'";    
            }
            else
            {
                query = "UPDATE current_booking_status SET non_ac_seat = '"+(av_seats-no_of_passengers)+"' WHERE train_no = '"+train_no+"' and date = '"+date+"'";
            }
            int rs2 = st.executeUpdate(query);
            out.println("Ticket Booking Successful.");

            String query1 = "SELECT * from ticket ORDER BY pnr DESC";
            rs = st.executeQuery(query1);
            rs.next();
            int pnr = Integer.parseInt(rs.getString("pnr"));
			ResultSet rs3;
			int z=0;
            for(int i=0; i<no_of_passengers; i++)
            {
				query1 = "SELECT * from meals WHERE train_no='" + train_no + "' AND type='"+meal[i]+"'";
				rs3=st.executeQuery(query1);
				if(rs3.next())
					z=Integer.parseInt(rs3.getString("meal_id"));
				//out.println(z);
				if(z!=0)	
					query = "INSERT INTO passenger (pnr, name, age, gender, seat_no,Class,meal_id) VALUES ( '" + pnr + "', '" + name[i] + "', '" + age[i] + "', '" + gender[i] + "', '" + (av_seats-i) + "', '"+clas+"','"+z+"')";
                else
					query = "INSERT INTO passenger (pnr, name, age, gender, seat_no,Class) VALUES ( '" + pnr + "', '" + name[i] + "', '" + age[i] + "', '" + gender[i] + "', '" + (av_seats-i) + "','"+clas+"')";
				rs2 = st.executeUpdate(query); 
            }
%>  
            <<p><a href="home.jsp"><b>Return.</b></a></p>
<%
        }
        else if(av_seats>0)
        {
			query = "Insert INTO ticket (user_id, fare, train_no, journey_date) VALUES ('"+user_id+ "','" + fare + "','" +train_no+"','" +date+"')";
            rs1 = st.executeUpdate(query);
			int y=0;
            if(clas.equalsIgnoreCase("AC"))
            {
                query = "UPDATE current_booking_status SET ac_seat = '"+y+"' WHERE train_no = '"+train_no+"' and date = '"+date+"'";    
            }
            else
            {
                query = "UPDATE current_booking_status SET non_ac_seat = '"+y+"' WHERE train_no = '"+train_no+"' and date = '"+date+"'";
            }
            int rs2 = st.executeUpdate(query);
            out.println("Tickets confirmed for some passengers");

            String query1 = "SELECT * from ticket ORDER BY pnr DESC";
            rs = st.executeQuery(query1);
            rs.next();
            int pnr = Integer.parseInt(rs.getString("pnr"));
			ResultSet rs3;
			int z=0;
            for(int i=0; i<av_seats; i++)
            {
				query1 = "SELECT * from meals WHERE train_no='" + train_no + "' AND type='"+meal[i]+"'";
				rs3=st.executeQuery(query1);
				if(rs3.next())
					z=Integer.parseInt(rs3.getString("meal_id"));
				//out.println(z);
				if(z!=0)	
					query = "INSERT INTO passenger (pnr, name, age, gender, seat_no,Class,meal_id) VALUES ( '" + pnr + "', '" + name[i] + "', '" + age[i] + "', '" + gender[i] + "', '" + (av_seats-i) + "', '"+clas+"','"+z+"')";
                else
					query = "INSERT INTO passenger (pnr, name, age, gender, seat_no,Class) VALUES ( '" + pnr + "', '" + name[i] + "', '" + age[i] + "', '" + gender[i] + "', '" + (av_seats-i) + "','"+clas+"')";
				rs2 = st.executeUpdate(query); 
            }
			z=0;
			for(int i=av_seats; i<no_of_passengers; i++)
            {
				query1 = "SELECT * from meals WHERE train_no='" + train_no + "' AND type='"+meal[i]+"'";
				rs3=st.executeQuery(query1);
				if(rs3.next())
					z=Integer.parseInt(rs3.getString("meal_id"));
				//out.println(z);
				if(z!=0)	
					query = "INSERT INTO passenger (pnr, name, age, gender,booking_status, seat_no,Class,meal_id) VALUES ( '" + pnr + "', '" + name[i] + "', '" + age[i] + "', '" + gender[i] + "', 'waiting','0', '"+clas+"','"+z+"')";
                else
					query = "INSERT INTO passenger (pnr, name, age, gender,booking_status, seat_no,Class) VALUES ( '" + pnr + "', '" + name[i] + "', '" + age[i] + "', '" + gender[i] + "', 'waiting','0','"+clas+"')";
				rs2 = st.executeUpdate(query); 
            }
			
			if(clas.equalsIgnoreCase("AC"))
            {
                query = "UPDATE current_booking_status SET ac_waitlist = '"+(x+no_of_passengers-av_seats)+"' WHERE train_no = '"+train_no+"' and date = '"+date+"'";    
            }
            else
            {
                query = "UPDATE current_booking_status SET non_ac_waitlist = '"+(x+no_of_passengers-av_seats)+"' WHERE train_no = '"+train_no+"' and date = '"+date+"'";
            }
			rs2 = st.executeUpdate(query);
%>
            <p><a href="home.jsp"><b>Return.</b></a></p>
<%
        }
		else
		{
			query = "Insert INTO ticket (user_id, fare, train_no, journey_date) VALUES ('"+user_id+ "','" + fare + "','" +train_no+"','" +date+"')";
            rs1 = st.executeUpdate(query);
			int y=0;
			out.println("None of the tickets are confirmed.");
			
			String query1 = "SELECT * from ticket ORDER BY pnr DESC";
            rs = st.executeQuery(query1);
            rs.next();
            int pnr = Integer.parseInt(rs.getString("pnr"));
			
			ResultSet rs3;
			int z=0,rs2;
			for(int i=0; i<no_of_passengers; i++)
            {
				z=0;
				query1 = "SELECT * from meals WHERE train_no='" + train_no + "' AND type='"+meal[i]+"'";
				rs3=st.executeQuery(query1);
				if(rs3.next())
					z=Integer.parseInt(rs3.getString("meal_id"));
				//out.println(z);
				if(z!=0)	
					query = "INSERT INTO passenger (pnr, name, age, gender,booking_status, seat_no,Class,meal_id) VALUES ( '" + pnr + "', '" + name[i] + "', '" + age[i] + "', '" + gender[i] + "', 'waiting','0', '"+clas+"','"+z+"')";
                else
					query = "INSERT INTO passenger (pnr, name, age, gender,booking_status, seat_no,Class) VALUES ( '" + pnr + "', '" + name[i] + "', '" + age[i] + "', '" + gender[i] + "', 'waiting','0','"+clas+"')";
				rs2 = st.executeUpdate(query); 
            }
			
			if(clas.equalsIgnoreCase("AC"))
            {
                query = "UPDATE current_booking_status SET ac_waitlist = '"+(x+no_of_passengers)+"' WHERE train_no = '"+train_no+"' and date = '"+date+"'";    
            }
            else
            {
                query = "UPDATE current_booking_status SET non_ac_waitlist = '"+(x+no_of_passengers)+"' WHERE train_no = '"+train_no+"' and date = '"+date+"'";
            }
			rs2 = st.executeUpdate(query);
%>
            <p><a href="home.jsp"><b>Return.</b></a></p>
<%
		}
    }
%>