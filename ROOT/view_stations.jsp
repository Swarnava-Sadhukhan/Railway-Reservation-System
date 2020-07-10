<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%
    //if(session.getAttribute("id")!="111111111")
        //response.sendRedirect("index.jsp");
%>

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
        <link rel="stylesheet" href="view_electives.css">
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
            String query = "SELECT * FROM station";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/DBMS_Project", "root", "root");
            Statement st = con.createStatement();

            ResultSet rs;
        %>
            
        <div class="container content">
            <h3>Stations at a Glance</h3>
            
            <table id = "table_1" class="table table-striped table-bordered">
                <tbody>
                    <tr>
                        <th>
                            Station ID
                        </th>
                        <th>
                            Station Name
                        </th>
                    </tr>
                    <%
                        rs = st.executeQuery(query);
        
                        while(rs.next())
                        {
                    %>
                            <tr>
                                <td>
                                    <%= rs.getString("station_id")%> 
                                </td>
                                <td>
                                    <%= rs.getString("station_name")%> 
                                </td>
                            </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <button class="btn btn-primary" onclick="location.href = 'post_admin_login.jsp'">
                Back
            </button>
        </div>
        
        <jsp:include page = "includes/footer.jsp"/>

    </body>

</html>