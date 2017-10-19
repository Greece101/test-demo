<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home_user.aspx.cs" Inherits="Home_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory and Sales</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="CSS/jquery.js"></script>
    <link href="CSS/SodaInMainStyle.css" rel="stylesheet" />
    <link rel="icon" href="images/newbg.jpg"/>
</head>
<body>
   
 <form id="form1" runat="server">
   
     <div id="nav" class="nbar">
         <a href="javascript:history.go(0)" id="h">Home</a>
         <a href="About.aspx" id="a">About</a>
         <a href="#stocks" id="st" onclick="Stocks()">Stocks</a>
         <a href="#sales" id="sa" onclick="Sales()">Sales</a>
         <a href="#logout" id="lo">Logout</a>
         <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
           </div>
      
     <div style="display:none" id="mySidebar">
  <button onclick="w3_close()" class="w3-bar-item w3-large">Close &times;</button>
  <a href="#" ">Link 1</a>
  <a href="#"">Link 2</a>
  <a href="#">Link 3</a>
</div>
     <div id="mdiv">
         <img src="images/Adobe%20Spark%20(1).jpg" id="pic"  alt="Food" style="width: 95%; height: 510px;"/>
       
 </div>
    
      
 </form>
           
    <script>
        function Stocks() {
           // window.open("Default2.aspx");
            //Response.Redirect("~/testingg.aspx");
            alert("You are a staff you cannot access this page. Thank You!");
        }
    </script>
    
        <script>
            function Sales() {
                window.open("Sales_user.aspx");
            }
    </script>

    <!--      <script>
           $(document).ready(function () {
               $("#a").click(function () {
                   $('#about-drpdown').load('AboutHTML.html #main');
                   $("#pic").hide();
             
               });
           });
</script>-->

      <script>
         $(document).ready(function () {
             $("#a").click(function () {
                 $("#about-drpdown").slideDown("fast");
                 $("#pic").hide();
             });
         });
</script>
    <!--
      <script>
          $(document).ready(function () {
              $("#c").click(function () {
                  $("#contact-drpdown").slideDown("fast");
                  $("#about-drpdown").slideUp("fast");
                //  $("#stocks-drpdown").slideUp("fast");
                //  $("#sales-drpdown").slideUp("fast");
                  $("#pic").hide();
              });
          });
</script>

    <script>
        $(document).ready(function () {
            $("#st").click(function () {
                $("#stocks-drpdown").slideDown("fast");
                $("#about-drpdown").slideUp("fast");
                $("#contact-drpdown").slideUp("fast");
                $("#sales-drpdown").slideUp("fast");
                $("#pic").hide();
            });
        });
</script>

      <script>
          $(document).ready(function () {
              $("#sa").click(function () {
                  $("#sales-drpdown").slideDown("fast");
                  $("#about-drpdown").slideUp("fast");
                  $("#contact-drpdown").slideUp("fast");
                  $("#stocks-drpdown").slideUp("fast");
                  $("#pic").hide();
              });
          });
</script>
       -->
    <script>
        $(document).ready(function () {
            $('#lo').on('click', function (e) {
                if (confirm("Are you sure you want to logout?"))
                    window.location.href = "mainLogin.aspx";

                return false;
            });
        });
    </script>
    <script>
        function myFunction() {
            var x = document.getElementById("nav");
            if (x.className === "nbar") {
                x.className += " responsive";
            } else {
                x.className = "nbar";
            }
        }
</script>
</body>
</html>
