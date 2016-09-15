<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Masters.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <style>
    .Info{
    padding-left:250px;
}
        .MasterMenu{
           
            padding:50px;
            padding-top:60px;
           
        }
        body {
            margin:0;
            padding-bottom:0;
            font-family:sans-serif;
            background: #2c3e50;
        }
        .Infomenu{
            padding:10px;
            background-color:#000000;
            width:180px;

        }
        .InfoLabel{
            padding:10px;
           
        }  
#wrapper
{
 padding-left: 0;
 -webkit-transition: all 0.5s ease;
 -moz-transition: all 0.5s ease;
 -o-transition: all 0.5s ease;
 transition: all 0.5s ease;
}
#wrapper.toggled
{
 padding-left: 250px;
}
#sidebar-wrapper
{
 z-index: 1000;
 position: fixed;
 left: 250px;
 width: 0;
 height: 100%;
 margin-left: -250px;
 overflow-y: auto;
 background: #ffffff;/* 000000*/
 -webkit-transition: all 0.5s ease;
 -moz-transition: all 0.5s ease;
 -o-transition: all 0.5s ease;
 transition: all 0.5s ease;
}
#wrapper.toggled #sidebar-wrapper
{
 width: 250px;
}
.sidebar-nav
{
 position: absolute;
 top: 0;
 width: 180px;/*250*/
 margin: 0;
 padding: 0;
 list-style: none;
}

.sidebar-nav li
{
 text-indent: 20px;
 line-height: 40px;
}

.sidebar-nav li a
{
 display: block;
 text-decoration: none;
 color: #000000;/* ffffff*/
/* background-color:#999999;*/
}

.sidebar-nav li a:hover<a href="Masters.aspx.cs">Masters.aspx.cs</a>
{
 text-decoration: none;
 color: #ffffff;/*ffff80*/
 font-weight:bold;
 /*background: rgb(255,255,255,0.2);*/
 background:#808080;
 width: 250px;
}

.sidebar-nav li a:active, .sidebar-nav li a:focus
{
 text-decoration: none;
}

.sidebar-nav > .sidebar-brand
{
 height: 65px;
 font-size: 18px;
 font-family:Arial;
 line-height: 60px;
}

.sidebar-nav > .sidebar-brand a
{
 color: #191919;/*#999999*/
}

.sidebar-nav > .sidebar-brand a:hover
{
 color: #999999;/*#fff*/
 background: none;
}
.session{
    float:right;
    color:ghostwhite;
    font-size:35px;
    font-family:Calibri;
    padding-right:105px;
}

        @media (min-width:300px) /*768*/
        {
            #wrapper {
                padding-left: 250px;
            }

                #wrapper.toggled {
                    padding-left: 0;
                }

            #sidebar-wrapper {
                width: 250px;
            }

            #wrapper.toggled #sidebar-wrapper {
                width: 0;
            }

            #page-content-wrapper {
                padding: 20px;
                position: relative;
            }

            #wrapper.toggled #page-content-wrapper {
                position: relative;
                margin-right: 0;
            }

         
                    li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}


li a:hover, .dropdown:hover .dropbtn {
    background-color: red;
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 220px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1}
        }
        .show {display:block;}
         .Cimg{
            float:right;
            margin-right:3%;
            margin-top:1px;
            border-bottom-left-radius:2px;
            border-bottom-right-radius:2px;
            border-top-left-radius:2px;
            border-top-right-radius:2px;
            height:45px;
            
        }
    </style>
    <script type="text/javascript">
        history.forward();
</script>
    <script>
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}
function deptdrpdwm() {
    document.getElementById("mydropdowndept").classList.toggle("show");
}
function tckdrpdwm() {
    document.getElementById("tick").classList.toggle("show");
}
function tckstatdrpdwm() {
    document.getElementById("tckstat").classList.toggle("show");
}
function desgdrpdwm() {
    document.getElementById("desg").classList.toggle("show");
}
function locdrpdwm() {
    document.getElementById("loc").classList.toggle("show");
}
function salmas() {
    document.getElementById("Sal").classList.toggle("show");
}
function pfg() {
    document.getElementById("pf").classList.toggle("show");
}
function logout() {
    document.getElementById("lg").classList.toggle("show");
}
function comp() {
    document.getElementById("cm").classList.toggle("show");
}
// Close the dropdown if the user clicks outside of it
window.onclick = function(e) {
  if (!e.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    for (var d = 0; d < dropdowns.length; d++) {
      var openDropdown = dropdowns[d];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>
</head>

<body>
    <form id="form1" runat="server">
     <div>
        <br />
        <br />
        <div id="Label" class="InfoLabel">
        <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid" >
        <asp:Label ID="Master1" runat="server" Text="EasyTask Master"  Font-Bold="True" Font-Names="Calibri (Body)" Font-Size="35px" ForeColor="White" CssClass="Info" ></asp:Label>
          <strong style="background:border-box" class="session" > <%=Session["TUID"].ToString() %> </strong>  
        <asp:ImageButton ID="tadblogout" CssClass="Cimg" ToolTip="Click To Logout" ImageUrl="~/images/Logout-icon.png" runat="server"  OnClick="tadblogout_Click"/>
                   
        </asp:Panel>
        </div>
        <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
  <div id="wrapper">
      <div id="sidebar-wrapper">
           <br /> 
            <ul class="sidebar-nav">
                 
                 <li class="dropdown"> 
                     <a href="javascript:void(0)" class="dropbtn" > &nbsp;&nbsp;Home</a> </li>
                
                <li class="dropdown">
                 <a href="javascript:void(0)" class="dropbtn" onclick="deptdrpdwm()">&nbsp;&nbsp;Department</a>
                     <div class="dropdown-content" id="mydropdowndept">
                         <a href="DepartmentMaster.aspx">Department Masters</a>
                     </div>
                 </li>
                <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn" onclick="myFunction()">&nbsp;&nbsp;User</a>
    <div class="dropdown-content" id="myDropdown">
      <a href="UserRegistration.aspx">New User Signup</a>
        
    </div>
                    </li>
                
                 <li class="dropdown"><a href="javascript:void(0)" class="dropbtn" onclick="locdrpdwm()">&nbsp;&nbsp;Location</a>
                     <div class="dropdown-content" id="loc">
                         <a href="LocationMaster.aspx">Location Master</a>
                         <a href ="SublocationMaster.aspx">Sub Location Master</a>
                     </div>
                 </li>
                 <li class="dropdown"><a href="javascript:void(0)" class="dropbtn" onclick="desgdrpdwm()">&nbsp;&nbsp;Designation</a>
                     <div class="dropdown-content" id="desg">
                         <a href="DesignationMaster.aspx">Designation Masters</a>
                     </div> 
                 </li>
                <li class="dropdown" >
                    <a href="javascript:void(0)" class="dropbtn" onclick="salmas()">&nbsp;&nbsp;Salutation</a>
                    <div class="dropdown-content" id="Sal">
                        <a href="SalutaionMaster.aspx">Salutation Masters</a>
                    </div>
                </li>
                <li class="dropdown" >
                    <a href="javascript:void(0)" class="dropbtn" onclick="tckdrpdwm()">&nbsp;&nbsp;Ticket Type</a>
                    <div class="dropdown-content" id="tick">
                        <a href="TicketType.aspx">Ticket Type Masters</a>
                    </div>
                </li>
                <li class="dropdown" >
                    <a href="javascript:void(0)" class="dropbtn" onclick="tckstatdrpdwm()">&nbsp;&nbsp;Ticket Status</a>
                    <div class="dropdown-content" id="tckstat">
                        <a href="TicketStatus.aspx">Ticket Status Masters</a>
                    </div>
                </li>
               <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn" onclick="comp()">Comapny Master</a>
                    <div class="dropdown-content" id="cm">
                        <a href="Company.aspx">Insert Comapny Details</a>
                    </div>
                </li>
                 <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn" onclick="pfg()">&nbsp;Forget Password</a>
                    <div class="dropdown-content" id="pf">
                        <a href="ForgetPassword.aspx">Password Retrieve </a>
                    </div>
                </li>
                
                <%--<li class="dropdown">
                    <a href ="MastersLogin.aspx" class="dropbtn" onclick="logout()">&nbsp;Logout</a>
                    <div class="dropdown-content" id ="lg">
                        
                    </div>
                </li>--%>
            </ul>
          </div>
  </div> 
</form>

</body>
</html>

