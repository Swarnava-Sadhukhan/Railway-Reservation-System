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
	button
{
	height:35px;
	width:200px;
}
/*
.link {
  text-decoration: none;
  color:black;
}

.link:hover {
  text-decoration: underline;
  color:white;
}*/

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

.inner
{
    position: relative;
    /*padding-left: 30%;
    padding-right: 30%;*/
}

.form-text
{
    text-align: left;
}


.content
{
    /*padding-bottom: 10px;*/
    position: relative;
    text-align: center;
	padding-bottom:30px;
	padding-top:0px;
}

footer
{
    background-color: #9CE7F9;
    color:black;
    bottom: 0;
    font-style: italic;
	font-weight:bold;
	height:30px;
    width: 100%;
	position:relative;
}
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

    <body style="background-color:#E7F9FE; color:black; padding-top:0px;">
    	
        <div class="navbar navbar-inverse" style="background-color:#9CE7F9	; color:black; padding-top:0px;">
			<jsp:include page = "includes/header.jsp" />
            <div class="container" >
                <ul class="nav navbar-nav" style="background-color:#9CE7F9	; color:black; padding-top:0px;">
                    <li><a href="home.jsp" style="color:black	; padding-left:25px"><b>Home</b></a></li>
                    <!--<li><a href="https://www.iiests.ac.in" target="_blank">IIEST</a></li>
                    <li><a href="#">Page 2</a></li>-->
                    <li><a href="reset_password.jsp" style="color:black"><b>Reset Password</b></a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href = "logout_script.jsp" style="color:black"><span class = "glyphicon glyphicon-log-out"></span> <b>Log out</b></a></li>
                </ul>
            </div>
        </div> 
        
        <div class="banner_image" style="background-color:#E7F9FE; color:black; padding-top:0px">
            <div class="container content" style="background-color:#9CE7F9">
                <div class="row" style=" padding-top:0px;background-color:#9CE7F9	; color:black;">
                    <div class="inner" style="background-color:#9CE7F9	; color:black; padding-top:0px;">
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

                        <div id="myModal1" class="modal" >
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
                        <div id="myModal2" class="modal" >
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