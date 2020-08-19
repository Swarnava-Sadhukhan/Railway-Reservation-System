<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%
	int pass_id = Integer.parseInt(request.getParameter("passenger_id"));
	int pnr = Integer.parseInt(request.getParameter("pnr"));
	//out.println("Passenger ID is "+pass_id);
	String user_id = (String)session.getAttribute("user_id");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_database", "root", "");
		Statement st = con.createStatement();
		int rs3;
		String query1="SELECT * from passenger where passenger_id = '" + pass_id+"' and pnr='"+pnr+"'";
		ResultSet rs;
		rs=st.executeQuery(query1);
%>
<%
		String q,query;
		ResultSet rs2;
		ResultSet rs5;
		ResultSet rs6;
		int rs1,seat=0,stat; 
		if(rs.next())
		{
			String clas=rs.getString(8);
			String status=rs.getString(6);
			int seat_no=Integer.parseInt(rs.getString(7));
			if(status.equalsIgnoreCase("confirmed"))
				stat=1;
			else
				stat=0;
			query1="SELECT * FROM ticket where pnr = '"+pnr+"'";
			rs2=st.executeQuery(query1);
			int fare;
			if(rs2.next())
			{
				fare=Integer.parseInt(rs2.getString(4));
%>
<%
				String train_no=rs2.getString(5);
				String bdate=rs2.getString(6);
				query1="Insert INTO cancellation_list(pnr,pass_id,user_id,refund_amount) VALUES ('"+pnr+"','"+pass_id+"','"+user_id+"','"+fare+"')";
				rs3=st.executeUpdate(query1);
				
				query = "DELETE FROM passenger WHERE passenger_id = '" + pass_id+"'";
				rs1=st.executeUpdate(query);
				
				query="SELECT * FROM passenger where pnr='"+pnr+"'";
				rs6=st.executeQuery(query);
				if(!rs6.next())
				{
					q="DELETE FROM ticket WHERE pnr='"+pnr+"'";
					rs3=st.executeUpdate(q);
				}
				
				q="SELECT * FROM current_booking_status WHERE train_no='"+train_no+"' and date='"+bdate+"'";
				rs5=st.executeQuery(q);
				if(rs5.next())
				{
					int ac_wait=Integer.parseInt(rs5.getString(7));
					int nac_wait=Integer.parseInt(rs5.getString(8));
					if(stat==1)
					{
						if(clas.equalsIgnoreCase("AC"))
						{
							seat=Integer.parseInt(rs5.getString("ac_seat"));
							seat=seat+1;
							rs3=st.executeUpdate("UPDATE current_booking_status SET ac_seat = '"+seat+"' WHERE train_no = '"+train_no+"' and date = '"+bdate+"'");
						}
						else
						{
							seat=Integer.parseInt(rs5.getString("non_ac_seat"));
							seat=seat+1;
							rs3=st.executeUpdate("UPDATE current_booking_status SET non_ac_seat = '"+seat+"' WHERE train_no = '"+train_no+"' and date = '"+bdate+"'");
						}
						out.println("Seats updated");
					}
					else
						out.println("Seats not updated");
					int st2,f;
					
					q="SELECT * from passenger,ticket WHERE passenger.pnr=ticket.pnr AND train_no='"+train_no+"' AND journey_date='"+bdate+"' AND booking_status='waiting' AND fare='"+fare+"' ORDER BY booking_date";
					rs6=st.executeQuery(q);
					if(rs6.next())
					{
						int p_id=Integer.parseInt(rs6.getString(1));
						query1="UPDATE passenger SET booking_status='confirmed' WHERE passenger_id='"+p_id+"'";
						rs3=st.executeUpdate(query1);
						
						query1="UPDATE passenger SET seat_no='"+seat_no+"' WHERE passenger_id='"+p_id+"'";
						rs3=st.executeUpdate(query1);
						
						if(clas.equalsIgnoreCase("AC"))
						{
							seat=seat-1;
							f=0;
							rs3=st.executeUpdate("UPDATE current_booking_status SET ac_seat = '"+seat+"' WHERE train_no = '"+train_no+"' and date = '"+bdate+"'");
							out.println(" Seats updated");
							out.println(" ");
							out.println("Another passenger confirmed from the waiting list");
						}
						else
						{
							seat=seat-1;
							f=1;
							rs3=st.executeUpdate("UPDATE current_booking_status SET non_ac_seat = '"+seat+"' WHERE train_no = '"+train_no+"' and date = '"+bdate+"'");
							out.println("Seats updated");
							out.println(" ");
							out.println("Another passenger confirmed from the waiting list");
						}
					
						
						if(f==0)
						{
								st2=ac_wait-1;
								rs3=st.executeUpdate("UPDATE current_booking_status SET ac_waitlist = '"+(st2)+"' WHERE train_no = '"+train_no+"' and date = '"+bdate+"'");
								out.println(" waiting list updated");
						}
						else
						{
								st2=nac_wait-1;
								rs3=st.executeUpdate("UPDATE current_booking_status SET non_ac_waitlist = '"+(st2)+"' WHERE train_no = '"+train_no+"' and date = '"+bdate+"'");
								out.println(" waiting list updated");
						}
						
					}
					
				}
			}
		}
	}
	catch(Exception ex)
	{
	}
%>
		<a href="home.jsp" style="color:black"><h1><b>Return to the Home Page</b></h1></a>
<%		
	
%>
</div>