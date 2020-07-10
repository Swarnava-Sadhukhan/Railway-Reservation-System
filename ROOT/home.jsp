<%
    String user_id = (String)session.getAttribute("user_id");
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
    </head>
    
    <body>
        <div class="navbar">
            <table>
                <tr>
                    <td><img src="img/trian.png" alt="" height="150px" align="middle">
                    Railway Reservation System</td>
                </tr>
            </table>
        </div>
        
        <div class="homeScreen">
            <table style="float: right">
                <tr>
                    <th><button onClick="HomeClick()">Home</button></th>
                    <th><button onClick="SearchTrainClick()">Search Trains</button></th>
                    <th><button onClick="BookTrainClick()">Book Train</button></th>
                    <th><button onClick="BookingsClick()">Bookings</button></th>
                    <!--<th><button onClick="">Administrator</button></th>-->
                </tr>
            </table>
            <br>
            <p style="font-size: 24px" id="LoggedIn"><u>Logged in as : <%= user_id %></u></p>
            <div class="content">
                <div id="Home">
                    This is the home page
                </div>
                
                <div id="SearchTrain" hidden=true>
                        <table>
                            <tr>
                                <td>From:</td>
                                <td><input class="loginForm" type="text" id="Boarding" name="Boarding"></td>
                            </tr>
                            <tr>
                                <td>To:</td>
                                <td><input class="loginForm" type="text" id= "Destination" name="Destination"></td>
                            </tr>
                            <tr>
                                <td>Date:</td>
                                <td><input class="loginForm" type="text" id= "Date" name="Date"></td>
                            </tr>
                        </table>
                        <br>
                        <button onclick="SearchClick()">Search</button>
                    </div>

                <div id="BookTrain" hidden=true>
                        <table>
                            <tr>
                                <td>Train No:</td>
                                <td><input class="loginForm" type="text" name="Train" id="Train"></td>
                            </tr>
                            <tr>
                                <td>From:</td>
                                <td><input class="loginForm" type="text" name="Boarding" id="Boarding"></td>
                            </tr>
                            <tr>
                                <td>To:</td>
                                <td><input class="loginForm" type="text" name="Destination" id="Destination"></td>
                            </tr>
                            <tr>
                                <td>Date:</td>
                                <td><input class="loginForm" type="date" name="Date" id="BDate"></td>
                            </tr>
                            <tr>
                                    <td>Class:</td>
                                    <td><select style="font-size: 30px;color:dimgray;" name="BookingClass" id="BookingClass">
                                            <option value="AC">AC</option>
                                            <option value="NAC">Non-AC</option>
                                        </select>
                                    </td>
                            </tr>
                            <tr>
                                <td>No of Passenger:</td>
                                <td><input class="loginForm" type="number" name="Passenger"></td>
                            </tr>
                        </table>
                        <br>
                        <button onclick="BookClick()">Book</button>
                    </div>
                    

                <div id="Bookings" hidden=true>
                    Your Current Bookings:
                    
                </div>
            </div>    
        </div>
    </body>

</html>