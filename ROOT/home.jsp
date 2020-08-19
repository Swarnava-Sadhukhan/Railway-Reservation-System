<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%
    String user_id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("name");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Railway Reservation System</title>
        <link href="style.css" rel="stylesheet">
        <script type="text/javascript" src="js/Action.js"></script>
		<script>
			function HomeClick()
{
    document.getElementById("SearchTrain").hidden=true;
    document.getElementById("Bookings").hidden=true;
    document.getElementById("BookTrain").hidden=true;
    document.getElementById("Home").hidden=false;
}
function SearchTrainClick()
{
    document.getElementById("Bookings").hidden=true;
    document.getElementById("Home").hidden=true;
    document.getElementById("BookTrain").hidden=true;
    document.getElementById("SearchTrain").hidden=false;
}
function BookTrainClick()
{
    document.getElementById("SearchTrain").hidden=true;
    document.getElementById("Bookings").hidden=true;
    document.getElementById("Home").hidden=true;
    document.getElementById("BookTrain").hidden=false;
}
function BookingsClick()
{
    document.getElementById("SearchTrain").hidden=true;
    document.getElementById("Home").hidden=true;
    document.getElementById("BookTrain").hidden=true;
    document.getElementById("Bookings").hidden=false;
}

function SearchClick()
{
    let a = document.getElementById("Boarding").value;
    let b = document.getElementById("Destination").value;
    let c = document.getElementById("Date").value;
    let req='http://localhost:8080/view_curr_status.jsp?from='+a+'&to='+b+'&date='+c;
    console.log(req);
    window.location.href=req;
}

function displayPassengerEntry()
{
    let a=document.getElementById("Passenger").value;
    console.log(a);
    if(a=="1")
    {
        document.getElementById("Pass1").hidden=false;
        document.getElementById("Pass2").hidden=true;
        document.getElementById("Pass3").hidden=true;
        document.getElementById("Pass4").hidden=true;
        document.getElementById("Pass5").hidden=true;
        document.getElementById("Pass6").hidden=true;
    }
    else if(a=="2")
    {
        document.getElementById("Pass1").hidden=false;
        document.getElementById("Pass2").hidden=false;
        document.getElementById("Pass3").hidden=true;
        document.getElementById("Pass4").hidden=true;
        document.getElementById("Pass5").hidden=true;
        document.getElementById("Pass6").hidden=true;
    }
    else if(a=="3")
    {
        document.getElementById("Pass1").hidden=false;
        document.getElementById("Pass2").hidden=false;
        document.getElementById("Pass3").hidden=false;
        document.getElementById("Pass4").hidden=true;
        document.getElementById("Pass5").hidden=true;
        document.getElementById("Pass6").hidden=true;
    }
    else if(a=="4")
    {
        document.getElementById("Pass1").hidden=false;
        document.getElementById("Pass2").hidden=false;
        document.getElementById("Pass3").hidden=false;
        document.getElementById("Pass4").hidden=false;
        document.getElementById("Pass5").hidden=true;
        document.getElementById("Pass6").hidden=true;
    }
    else if(a=="5")
    {
        document.getElementById("Pass1").hidden=false;
        document.getElementById("Pass2").hidden=false;
        document.getElementById("Pass3").hidden=false;
        document.getElementById("Pass4").hidden=false;
        document.getElementById("Pass5").hidden=false;
        document.getElementById("Pass6").hidden=true;
    }
    else
    {
        document.getElementById("Pass1").hidden=false;
        document.getElementById("Pass2").hidden=false;
        document.getElementById("Pass3").hidden=false;
        document.getElementById("Pass4").hidden=false;
        document.getElementById("Pass5").hidden=false;
        document.getElementById("Pass6").hidden=false;
    }
}
function BookTicket()
{
    let a = document.getElementById("Train").value;
    let b = document.getElementById("Boardingg").value;
    let c = document.getElementById("Destinationn").value;
    let d = document.getElementById("BDate").value;
    let e = document.getElementById("BookingClass").value;
    let f = document.getElementById("Passenger").value;
   
    let g= document.getElementById("Pass1N").value+','+document.getElementById("Pass2N").value+','+document.getElementById("Pass3N").value+','+document.getElementById("Pass4N").value+','+document.getElementById("Pass5N").value+','+document.getElementById("Pass6N").value+',';
    let h= document.getElementById("Pass1A").value+','+document.getElementById("Pass2A").value+','+document.getElementById("Pass3A").value+','+document.getElementById("Pass4A").value+','+document.getElementById("Pass5A").value+','+document.getElementById("Pass6A").value+',';
    let i= document.getElementById("Pass1G").value+','+document.getElementById("Pass2G").value+','+document.getElementById("Pass3G").value+','+document.getElementById("Pass4G").value+','+document.getElementById("Pass5G").value+','+document.getElementById("Pass6G").value+',';
    let j= document.getElementById("Pass1M").value+','+document.getElementById("Pass2M").value+','+document.getElementById("Pass3M").value+','+document.getElementById("Pass4M").value+','+document.getElementById("Pass5M").value+','+document.getElementById("Pass6M").value+',';
	
    let req = 'http://localhost:8080/book_tickets_submit.jsp?train_no=' + a + '&from=' + b + '&to=' + c + '&date=' + d + '&class=' + e + '&no_of_passengers='+ f + '&p='+ g +'&q='+ h +'&r='+i+'&s='+j;
    window.location.href=req;
}

function LogOut()
{
    window.location.href='http://localhost:8080/logout_script.jsp';
}
function CancelTicket()
{
	let a = document.getElementById("passenger_can").value;
	let b = document.getElementById("pnr_can").value;
	let req='http://localhost:8080/cancel_ticket_submit.jsp?passenger_id='+a+'&pnr='+b;
	window.location.href=req;
}
		</script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style>
		  .navbar
{
    width: 100%;
    height: 90px;
    background-color:blue;
    /*padding-left:50px;
    padding-right:50px;*/
    font-family:"Liberation Serif", Times, "Times New Roman", "serif";
    font-size:50px;
    color: floralwhite;
}

a:link {
  text-decoration: none;
}

a:visited {
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

a:active {
  text-decoration: none;
}
button
{
    background-color:#1D88EA;
	color:black;
    width: 200px;
    height: 50px;
    background-position: right;
    font-family:"Liberation Serif", Times, "Times New Roman", "serif";
    font-size:30px;
    align-content: center;
    border: none;
    border-radius: 5px;
}
button:hover
{
    background-color:#007FFF;
    color:white;
}
</style>

    </head>
    
    <body>
        <div class="navbar" style="background-color:#9CE7F9	; color:black; height:120px;">
            <table>
                <tr>
                    <td><img src="img/trian.png" alt="" height="150px" align="middle">
                    <a href="index.html" style="text-decoration:none;text-align:center; color:black">Railway Reservation System</a></td>
                </tr>
            </table>
        </div>
        
        <div class="homeScreen" style="background-color:#E7F9FE; color:black;">
            <table style="float: right">
                <tr>
                    <th><button onClick=HomeClick()>Home</button></th>
                    <th><button onClick=SearchTrainClick()>Search Trains</button></th>
                    <th><button onClick=BookTrainClick()>Book Ticket</button></th>
                    <th><button onClick=BookingsClick()>Bookings</button></th>
                    <th><button onClick=LogOut()>Log Out</button></th>
                    <!--<th><button onClick="">Administrator</button></th>-->
                </tr>
            </table>
            <br>
            <p style="font-size: 24px" id="LoggedIn"><u>Logged in as : </u><%= user_id %></p>
			<p style="font-size: 28px" id="LoggedIn"><b>Welcome <%= name %></b></p>
            <div class="content" style="background-color:#E7F9FE; color:black;">
                <div id="Home">
                    This is the home page. <br>Browse the various tabs to perform the respective task. 
                </div>
                
                <div id="SearchTrain" hidden=true style="background-color:#E7F9FE; color:black;">
						<p><b>Search for your desired train:</b></p>
                        <table>
                            <tr>
                                <td>From:</td>
                                <td><input class="loginForm" type="text" name="Boarding" id="Boarding" placeholder="Enter Station code" style="background-color:#C6E8FF;color:black;"></td>
                            </tr>
                            <tr>
                                <td>To:</td>
                                <td><input class="loginForm" type="text" name="Destination" id="Destination" placeholder="Enter Station code" style="background-color:#C6E8FF;color:black;"></td>
                            </tr>
                            <tr>
                                <td>Date:</td>
                                <td><input class="loginForm" type="text" name="Date" id="Date" placeholder="Enter date as dd-mm-yyyy" style="background-color:#C6E8FF;color:black;"></td>
                            </tr>
                        </table>
                        <br>
                        <button onclick=SearchClick()>Search</button>
                    </div>

                <div id="BookTrain" hidden=true style="background-color:#E7F9FE; color:black;">
						<p><b>Book tickets for your desired train:</b></p>
                        <table>
                            <tr>
                                <td>Train No:</td>
                                <td><input class="loginForm" type="text" name="Train" id="Train" style="background-color:#C6E8FF;color:black;"></td>
                            </tr>
                            <tr>
                                <td>From:</td>
                                <td><input class="loginForm" type="text" name="Boardingg" id="Boardingg" placeholder="Enter Station code" style="background-color:#C6E8FF;color:black;"></td>
                            </tr>
                            <tr>
                                <td>To:</td>
                                <td><input class="loginForm" type="text" name="Destinationn" id="Destinationn" placeholder="Enter Station code" style="background-color:#C6E8FF;color:black;"></td>
                            </tr>
                            <tr>
                                <td>Date:</td>
                                <td><input class="loginForm" type="text" name="BDate" id="BDate" placeholder="Enter date as dd-mm-yyyy" style="background-color:#C6E8FF;color:black;"></td>
                            </tr>
                            <tr>
                                    <td>Class:</td>
                                    <td><select style="font-size: 30px;color:dimgray;" name="BookingClass" id="BookingClass" style="background-color:#C6E8FF;color:black;">
                                            <option value="AC" style="background-color:#C6E8FF;color:black;">AC</option>
                                            <option value="NAC"style="background-color:#C6E8FF;color:black;">Non-AC</option>
                                        </select>
                                    </td>
                            </tr>
                            <tr>
                                <td>No of Passenger:</td>
                                <td><select onChange=displayPassengerEntry() style="font-size: 30px;color:dimgray;" name="Passenger" id="Passenger" style="background-color:#C6E8FF;color:black;">
                                        <option value="1" style="background-color:#C6E8FF;color:black;">1</option>
                                        <option value="2"style="background-color:#C6E8FF;color:black;">2</option>
                                        <option value="3" style="background-color:#C6E8FF;color:black;">3</option>
                                        <option value="4" style="background-color:#C6E8FF;color:black;">4</option>
                                        <option value="5" style="background-color:#C6E8FF;color:black;">5</option>
                                        <option value="6" style="background-color:#C6E8FF;color:black;">6</option>
                                    </select>
                                </td>
                            </tr>    
                            <tr id="Pass1" hidden="true">
                                    <td>Passenger1:</td>
                                    <td>Name<input class="loginForm" type="text" name="Name" id="Pass1N" style="background-color:#C6E8FF;color:black;width:250px" ></td>
                                    <td>Age<input class="loginForm" type="number" name="Age" id="Pass1A"style="background-color:#C6E8FF;color:black;width:250px"></td>
                                    <td>Gender<select style="font-size: 30px;color:dimgray;" name="Gender" id="Pass1G" style="background-color:#C6E8FF;color:black;">
                                            <option value="M"style="background-color:#C6E8FF;color:black;">Male</option>
                                            <option value="F" style="background-color:#C6E8FF;color:black;">Female</option>
                                        </select>
                                    </td>
									<td>Meals<select style="font-size: 30px;color:dimgray;" name="Meals" id="Pass1M" style="background-color:#C6E8FF;color:black;">
											<option value="N"style="background-color:#C6E8FF;color:black;">None</option>
                                            <option value="NV"style="background-color:#C6E8FF;color:black;">Non-Veg</option>
                                            <option value="V" style="background-color:#C6E8FF;color:black;">Veg</option>
                                        </select>
                                    </td>
									
                            </tr>
                            <tr id="Pass2" hidden="true">
                                    <td>Passenger2:</td>
                                    <td>Name<input class="loginForm" type="text" name="Name" id="Pass2N" style="background-color:#C6E8FF;color:black;width:250px"></td>
                                    <td>Age<input class="loginForm" type="number" name="Age" id="Pass2A"style="background-color:#C6E8FF;color:black;width:250px"></td>
                                    <td>Gender<select style="font-size: 30px;color:dimgray;" name="Gender" id="Pass2G"style="background-color:#C6E8FF;color:black;">
                                            <option value="M" style="background-color:#C6E8FF;color:black;">Male</option>
                                            <option value="F"style="background-color:#C6E8FF;color:black;">Female</option>
                                        </select>
                                    </td>
									<td>Meals<select style="font-size: 30px;color:dimgray;" name="Meals" id="Pass2M" style="background-color:#C6E8FF;color:black;">
											<option value="N"style="background-color:#C6E8FF;color:black;">None</option>
                                            <option value="NV"style="background-color:#C6E8FF;color:black;">Non-Veg</option>
                                            <option value="V" style="background-color:#C6E8FF;color:black;">Veg</option>
                                        </select>
                                    </td>
                            </tr>
                            <tr id="Pass3" hidden="true">
                                    <td>Passenger3:</td>
                                    <td>Name<input class="loginForm" type="text" name="Name" id="Pass3N" style="background-color:#C6E8FF;color:black;width:250px" ></td>
                                    <td>Age<input class="loginForm" type="number" name="Age" id="Pass3A" style="background-color:#C6E8FF;color:black;width:250px"></td>
                                    <td>Gender<select style="font-size: 30px;color:dimgray;" name="Gender" id="Pass3G">
                                            <option value="M">Male</option>
                                            <option value="F">Female</option>
                                        </select>
                                    </td>
									<td>Meals<select style="font-size: 30px;color:dimgray;" name="Meals" id="Pass3M" style="background-color:#C6E8FF;color:black;">
											<option value="N"style="background-color:#C6E8FF;color:black;">None</option>
                                            <option value="NV"style="background-color:#C6E8FF;color:black;">Non-Veg</option>
                                            <option value="V" style="background-color:#C6E8FF;color:black;">Veg</option>
                                        </select>
                                    </td>
                            </tr>
                            <tr id="Pass4" hidden="true">
                                    <td>Passenger4:</td>
                                    <td>Name<input class="loginForm" type="text" name="Name" id="Pass4N" style="background-color:#C6E8FF;color:black;width:250px"></td>
                                    <td>Age<input class="loginForm" type="number" name="Age" id="Pass4A" style="background-color:#C6E8FF;color:black;width:250px"></td>
                                    <td>Gender<select style="font-size: 30px;color:dimgray;" name="Gender" id="Pass4G" style="background-color:#C6E8FF;color:black;">
                                            <option value="M" style="background-color:#C6E8FF;color:black;">Male</option>
                                            <option value="F"style="background-color:#C6E8FF;color:black;">Female</option>
                                        </select>
                                    </td>
									<td>Meals<select style="font-size: 30px;color:dimgray;" name="Meals" id="Pass4M" style="background-color:#C6E8FF;color:black;">
											<option value="N"style="background-color:#C6E8FF;color:black;">None</option>
                                            <option value="NV"style="background-color:#C6E8FF;color:black;">Non-Veg</option>
                                            <option value="V" style="background-color:#C6E8FF;color:black;">Veg</option>
                                        </select>
                                    </td>
                            </tr>
                            <tr id="Pass5" hidden="true">
                                    <td>Passenger5:</td>
                                    <td>Name<input class="loginForm" type="text" name="Name" id="Pass5N" style="background-color:#C6E8FF;color:black;width:250px"></td>
                                    <td>Age<input class="loginForm" type="number" name="Age" id="Pass5A" style="background-color:#C6E8FF;color:black;width:250px"></td>
                                    <td>Gender<select style="font-size: 30px;color:dimgray;" name="Gender" id="Pass5G" style="background-color:#C6E8FF;color:black;">
                                            <option value="M" style="background-color:#C6E8FF;color:black;">Male</option>
                                            <option value="F" style="background-color:#C6E8FF;color:black;">Female</option>
                                        </select>
                                    </td>
									<td>Meals<select style="font-size: 30px;color:dimgray;" name="Meals" id="Pass5M" style="background-color:#C6E8FF;color:black;">
											<option value="N"style="background-color:#C6E8FF;color:black;">None</option>
                                            <option value="NV"style="background-color:#C6E8FF;color:black;">Non-Veg</option>
                                            <option value="V" style="background-color:#C6E8FF;color:black;">Veg</option>
                                        </select>
                                    </td>
                            </tr>
                            <tr id="Pass6" hidden="true">
                                    <td>Passenger6:</td>
                                    <td>Name<input class="loginForm" type="text" name="Name" id="Pass6N" style="background-color:#C6E8FF;color:black;width:250px"></td>
                                    <td>Age<input class="loginForm" type="number" name="Age" id="Pass6A" style="background-color:#C6E8FF;color:black;width:250px"></td>
                                    <td>Gender<select style="font-size: 30px;color:dimgray;" name="Gender" id="Pass6G" style="background-color:#C6E8FF;color:black;">
                                            <option value="M" style="background-color:#C6E8FF;color:black;">Male</option>
                                            <option value="F" style="background-color:#C6E8FF;color:black;">Female</option>
                                        </select>
                                    </td>
									<td>Meals<select style="font-size: 30px;color:dimgray;" name="Meals" id="Pass6M" style="background-color:#C6E8FF;color:black;">
                                            <option value="N"style="background-color:#C6E8FF;color:black;">None</option>
											<option value="NV"style="background-color:#C6E8FF;color:black;">Non-Veg</option>
                                            <option value="V" style="background-color:#C6E8FF;color:black;">Veg</option>
                                        </select>
                                    </td>
                            </tr>
                        </table>
                        <br>
                        <button onclick=BookTicket()>Book</button>
                    </div>
                    

                <div id="Bookings" hidden=true>
					<%
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_database", "root", "");
						Statement st = con.createStatement();
						String query = "SELECT * FROM ticket,passenger WHERE ticket.pnr=passenger.pnr and user_id='"+user_id+"'";
						ResultSet rs;
						rs = st.executeQuery(query);
						if(!rs.isBeforeFirst())
						{
					%>
							<p>You do not have any booking.</p>
					<%
						}
						else
						{
					%>
                    Your Current Bookings:<br>
					<table class="table table-striped " border=1 width=80%>
					<thead class="thead-dark" style="background-color:black; color:white;">
					<tr>
						<td>Name:</td>
						<td>Age:</td>
						<td>Gender:</td>
						<td>Passenger ID:</td>
						<td>PNR:</td>
						<td>Train Number:</td>
						<td>Journey Date:</td>
						<td>Booking Status:</td>
						<td>Class:</td>
						<td>Seat No.:</td>
						<td>Meal ID:</td>
						<td>Fare:</td>
						<td>Booking Date:</td>
					</tr>
					</thead>
					<%
						try
						{

							while(rs.next())
							{
					%>
					<tr style="border:1px solid black">
						<!--<td>Name: ""PNR: "+rs.getString(1)+" Booking Date : "+rs.getString(3)+" Fare : "+rs.getString(4)+" Train No. "+rs.getString(5)+" Journey Date: "+rs.getString(6)+"<br>");-->
						<td><%=rs.getString(9)%></td>
						<td><%=rs.getString(10)%></td>
						<td><%=rs.getString(11)%></td>
						<td><%=rs.getString(7)%></td>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(5)%></td>
						<td><%=rs.getString(6)%></td>
						<td><%=rs.getString(12)%></td>
						<td><%=rs.getString(14)%></td>
						<td><%=rs.getString(13)%></td>
						<td><%=rs.getString(15)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(3)%></td>
					</tr>			
					
					<%
							}
						}
						catch(Exception ex)
						{
						}
					%>
                   </table> 
				   <br>
				   <div style="height:300px;">
					   <b>Cancel Tickets:</b>
					   <table>
					   <tr>
							<td>Passenger ID: &nbsp <input name="passenger_can" id="passenger_can" type="text" class="loginForm" style="background-color:#C6E8FF;color:black;width:200px"></td>
						</tr>
						<tr>
							<td>PNR: &nbsp &nbsp <input name="pnr_can" id="pnr_can" type="text" class="loginForm" style="background-color:#C6E8FF;color:black;width:200px"></td><br>
					    </tr>
						</table>
						<br>
					   <button onClick=CancelTicket()>Cancel Ticket</button>
					   <%
						}
					   %>
					</div>
				</div>
            </div>    
        </div>
    </body>

</html>