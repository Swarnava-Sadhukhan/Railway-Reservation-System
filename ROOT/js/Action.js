// JavaScript Document
console.log("Hello");
function LoginClick()
{
    let a=document.getElementById("LoginEmail").value;
    let b=document.getElementById("LoginPassword").value;
    let req='http://localhost:8080/login_submit.jsp?user_id='+a+'&password='+b;
    console.log(req);
    window.location.href=req;
}

function AdminClick()
{
    let a=document.getElementById("LoginEmail").value;
    let b=document.getElementById("LoginPassword").value;
    let req='http://localhost:8080/admin_login_submit.jsp?user_id='+a+'&password='+b;
    console.log(req);
    window.location.href=req;
}

function SignupClick()
{
    window.location.href="signup.html";
}

function SignupSubmit()
{
    let a = document.getElementById("Email").value;
    let b = document.getElementById("Fname").value;
    let c = document.getElementById("Mname").value;
    let d = document.getElementById("Lname").value;
    let e = document.getElementById("Password").value;
    let f = document.getElementById("Dob").value;
    let g = document.getElementById("Gender").value;
    let h = document.getElementById("City").value;
    let i = document.getElementById("Contact").value;
    let req='https://localhost:8080/signup_script.jsp?user_id='+a+'&first_name='+b+'&middle_name='+c+'&last_name='+d+'&password='+e+'&dob='+f+'&gender='+g+'&city='+h+'&contact='+i;
    console.log(req);
    window.location.href=req;
}

// String user_id = request.getParameter("user_id");
//     String email = request.getParameter("user_id"); 
//     String first_name = request.getParameter("first_name");  
//     String middle_name = request.getParameter("middle_name");  
//     String last_name = request.getParameter("last_name"); 
//     String password = request.getParameter("password");
//     String dob = request.getParameter("dob"); 
//     String gender = request.getParameter("gender"); 
//     String city = request.getParameter("city"); 
//     int contact = Integer.parseInt(request.getParameter("contact"));
    

function Clicked()
{
    document.getElementById("show").innerHTML="Clicked";
}

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
    //let c = "12-12-2019";
    console.log(a);
    console.log(b);
    console.log(c);
    let req='http://localhost:8080/DBMS_Project/view_curr_status.jsp?from='+a+'&to='+b+'&date='+c;
    console.log(req);
    window.location.href=req;
}
