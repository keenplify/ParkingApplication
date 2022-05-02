    <%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ParkingApplication._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        h1{
            font-family: 'Roboto', sans-serif;
            font-weight: bold;  
        }
        header{
            background:linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url("img/1.jpg");
            background-repeat: no-repeat;
            background-size: cover;


        }
    </style>

    <header>

             <div class="container-fluid  text-center text-white">
                 <br>
                 <br>
                 <br> 
                 <br>  
                 <h1>Online Automated Parking System</h1>
                 <p class="text-center ">Smart parking technology has enhanced productivity, decreased operating expenses, <br> increased facility value, and done so much more.</p>
                  <p class="py-4">
                  <a  class=" btn btn-primary  text-white" role="button" aria-pressed="true" href="#"><i data-feather="plus-circle" class="text-white p-1"></i>Add Booking</a>
            </p>
                 <br> 
                 <br> 
             </div>

        </header>

    <div class="container">
        <div class="row">
          
        <div class="container col-md-6">
          
            <h1 class=" mt-5    ">Parking Your Vechicle Quick</h1>
            <p>
               Parking reservation system refers to a system designed to assist individuals in booking automobile (vehicle) parking spaces online. The technology is notable for quickly improving the website by allowing consumers to book parking spaces, access extra services, and even pay online. Customers may secure parking spots from the convenience of their own home or while on the road. 
            </p>
             <p>
With the advent of parking reservation systems, administrators may now add as many parking spot alternatives as they need, establish fees, give discounts, and specify availability periods, among other things. Furthermore, smart parking technology has enhanced productivity, decreased operating expenses, increased facility value, and done so much more.            </p>
           
               
        </div>
           
        <div class="col-md-6">
           <img src="img/parking-lot-sign-vector-illustration-white-flat-near-car-parked-cartoon-place-design-71619658 (1).jpg" class="img-fluid"/>
        </div>
        
    </div>
        </div>
        
    <div class="jumbotron">
       <h2 class="text-center">Services</h2>
    <p class="text-center">Parking Application to minimize time and increase efficiency of the present Parking Application.</p>
    <div class="row text-center py-2">
        
          
        <div class="col-md-4">
            <i data-feather="dollar-sign" class="feather-16" ></i>
            <p class=" py-2">Our Parking Application facilitates hassle free vehicle parking and reduces parking management costs.</p>
        
          
        </div>
           
        <div class="col-md-4">
             <i data-feather="minimize" ></i>
            <p class="py-2">To control the number of vehicles inside the parking lot.</p>
        </div>

        <div class="col-md-4">
             <i data-feather="clock" ></i>
            <p class=" py-2">Users can save time and effort by finding the best available spot within the given date and time frame.</p>
        </div>
        
    </div>  
    </div>

 

    


</asp:Content>
