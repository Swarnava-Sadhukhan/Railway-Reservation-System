<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>


<!DOCTYPE <!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Railway Reservation - Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
        <script src="main.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="view_trains.css">
    </head>
    
    <body>
        
        <jsp:include page = "includes/header.jsp"/>
        
        <div class="navbar navbar-inverse">
            <div class="container">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="https://www.iiests.ac.in" target="_blank">IIEST</a></li>
                    <li><a href="#">Page 2</a></li>
                    <li><a href="#">Page 3</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href = "logout_script.jsp"><span class = "glyphicon glyphicon-log-out"></span> Log out</a></li>
                </ul>
            </div>
        </div> 
        
        <%
            String from = request.getParameter("from");
            String to = request.getParameter("to");
            String date = request.getParameter("date");;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/DBMS_Project", "root", "root");
            Statement st = con.createStatement();
            String query = "SELECT train.train_no,train_name,source,departure,destination,arrival,ac_seat,ac_fare,non_ac_seat,non_ac_fare from train, passes_through, current_booking_status WHERE (train.train_no = current_booking_status.train_no and train.destination = '" + to +"' and train.train_no = passes_through.train_no and passes_through.station_id = '"+from+"' and current_booking_status.date = '"+date+"')"
                            +" UNION "+ 
                                "SELECT train.train_no,train_name,source,departure,destination,arrival,ac_seat,ac_fare,non_ac_seat,non_ac_fare from train, passes_through, current_booking_status WHERE (train.train_no = current_booking_status.train_no and train.source = '" + from +"' and train.train_no = passes_through.train_no and passes_through.station_id = '"+to+"' and current_booking_status.date = '"+date+"')";
            ResultSet rs, rs1;
            int train_no;
            
        %>
            
        <div class="container content">
            <h3>Trains Available</h3>
            
            <table id = "table_1" class="table table-striped table-bordered">
                <tbody>
                    <tr>
                        <th>
                            Train Number
                        </th>
                        <th>
                            Train Name
                        </th>
                        <th>
                            Source
                        </th>
                        <th>
                            Departure    
                        </th>
                        <th>
                            Destination
                        </th>
                        <th>
                            Arrival
                        </th>
                        <th>
                            AC Seats
                        </th>
                        <th>
                            AC Fare
                        </th>
                        <th>
                            Non AC Seats
                        </th>
                        <th>
                            Non AC Fare
                        </th>
                    </tr>
                    <%
                        rs = st.executeQuery(query);
                        
                        
                        while(rs.next())
                        {
                            train_no = Integer.parseInt(rs.getString("train_no"));
                    %>
                            <tr>
                                <td>
                                    <%= rs.getString("train_no")%> 
                                </td>
                                <td>
                                    <%= rs.getString("train_name")%> 
                                </td>
                                <td>
                                    <%= rs.getString("source")%> 
                                </td>
                                <td>
                                    <%= rs.getString("departure")%> 
                                </td>
                                <td>
                                    <%= rs.getString("destination")%> 
                                </td>
                                <td>
                                    <%= rs.getString("arrival")%> 
                                </td>
                                <td>
                                    <%= rs.getString("ac_seat")%> 
                                </td>
                                <td>
                                    <%= rs.getString("ac_fare")%> 
                                </td>
                                <td>
                                    <%= rs.getString("non_ac_seat")%> 
                                </td>
                                <td>
                                    <%= rs.getString("non_ac_fare")%> 
                                </td>
                                
                            </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <button class="btn btn-primary" onclick="location.href = 'home.jsp'">
                Back
            </button>
        </div>
        
        <jsp:include page = "includes/footer.jsp"/>

    </body>

</html>