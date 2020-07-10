<%@ page import ="java.io.*" %>

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
        <link rel="stylesheet" href="post_admin_login.css">
    </head>

    <style>
        .modal 
        {
            display: none; 
            position: fixed; 
            z-index: 1; 
            padding-top: 100px; 
            left: 0;
            top: 0;
            width: 100%;
            height: 100%; 
            overflow: auto; 
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4); 
        }
        .modal-content 
        {
            background-color: #9b87f5;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
            margin-top: 20%;
        }
        .close 
        {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover, .close:focus 
        {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
    </style>

    <body>
    	
        <jsp:include page = "includes/header.jsp" />
    	
        <div class="navbar navbar-inverse">
            <div class="container">
                <ul class="nav navbar-nav">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="https://www.iiests.ac.in" target="_blank">IIEST</a></li>
                    <li><a href="#">Page 2</a></li>
                    <li><a href="reset_password.jsp">Reset Password</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href = "logout_script.jsp"><span class = "glyphicon glyphicon-log-out"></span> Log out</a></li>
                </ul>
            </div>
        </div> 
        
        <div class="banner_image">
            <div class="container content">
                <div class="row">
                    <div class="inner">
                        <h1>Welcome Admin</h1>
                        <button class="btn btn-primary" onclick="location.href = 'set_train_reservation_details.jsp'">
                            Set Train Reservation Details
                        </button><br><br>
                        <button class="btn btn-primary" onclick="location.href = 'view_trains.jsp'">
                            View Trains
                        </button><br><br>
                        <button class="btn btn-primary" onclick="location.href = 'add_trains.jsp'">
                            Add Trains
                        </button><br><br>
                        <button class="btn btn-primary" onclick="location.href = 'view_stations.jsp'">
                            View Stations
                        </button><br><br>
                        <button class="btn btn-primary" onclick="location.href = 'add_stations.jsp'">
                            Add Stations
                        </button><br><br>
                        <button class="btn btn-primary" id="myBtn1">
                            View Stoppages
                        </button><br><br>
                        <button class="btn btn-primary" onclick="location.href = 'add_stoppages.jsp'">
                            Add Stoppages
                        </button><br><br>
                        <button class="btn btn-primary" id="myBtn2">
                            View Meals
                        </button><br><br>
                        <button class="btn btn-primary" onclick="location.href = 'add_meals.jsp'">
                            Add Meals
                        </button>

                        <div id="myModal1" class="modal">
                            <div class="modal-content">
                                <span class="close close1">&times;</span>
                                <form method="post" action="view_stoppages.jsp">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Train Number" name="train_no" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">View Stoppages</button>
                                </form>
                            </div>
                        </div>
                        <div id="myModal2" class="modal">
                            <div class="modal-content">
                                <span class="close close2">&times;</span>
                                <form method="post" action="view_meals.jsp">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Train Number" name="train_no" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">View Meals</button>
                                </form>
                            </div>
                        </div>
                        <script>
                            var modal1 = document.getElementById("myModal1");
                            var modal2 = document.getElementById("myModal2");
                            var btn1 = document.getElementById("myBtn1");
                            var btn2 = document.getElementById("myBtn2");
                            var span1 = document.getElementsByClassName("close1")[0];
                            var span2 = document.getElementsByClassName("close2")[0];
                            btn1.onclick = function() 
                            {
                                modal1.style.display = "block";
                            }
                            btn2.onclick = function() 
                            {
                                modal2.style.display = "block";
                            }
                            span1.onclick = function() 
                            {
                                modal1.style.display = "none";
                            }
                            span2.onclick = function() 
                            {
                                modal2.style.display = "none";
                            }
                            window.onclick = function(event) 
                            {
                                if (event.target == modal1)
                                    modal1.style.display = "none";
                                else if(event.target == modal2)
                                    modal2.style.display = "none";
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page = "includes/footer.jsp" />

    </body>

</html>