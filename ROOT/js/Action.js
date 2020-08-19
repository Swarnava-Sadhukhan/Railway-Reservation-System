// JavaScript Document
console.log("Hello");

function LoginClick()
{
    let x=document.getElementById("LoginEmail").value;
    let y=document.getElementById("LoginPassword").value;
	/*if((x.localeCompare("administrator@admin.com")==0)&&(y.localeCompare("password")==0))
	{
	let req='http://localhost:8080/admin_login_submit.jsp?user_id='+x+'&password='+y;
	console.log(req);
	window.location.href=req;
	/*}
	else
	{*/
		let req='http://localhost:8080/login_submit.jsp?user_id='+x+'&password='+y;
		console.log(req);
		window.location.href=req;

}

function signup(String user_id,String pass)
{
	let req='http://localhost:8080/login_submit.jsp?user_id='+user_id+'&password='+pass;
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
    let req='http://localhost:8080/signup_script.jsp?user_id='+a+'&first_name='+b+'&middle_name='+c+'&last_name='+d+'&password='+e+'&dob='+f+'&gender='+g+'&city='+h+'&contact='+i;
    console.log(req);
    window.location.href=req;
}
    

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
	let req='http://localhost:8080/cancel_ticket_submit.jsp?passenger_id='+a;
	window.location.href=req;
}