<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="EasyHelpDesk.Request" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Easytask Help Desk</title>
    <style>
        body{
            background-color:#f8f8f8;
            display:block;
            width:100%;
            color:#333;
        }
        .r1{
            font-family:Cambria;
            font-size:26px;
            font-style:oblique;
            background:#89a6b9;
            color:antiquewhite;
            float:left;
            margin-left:1px;
            width:100%;
            /*height:40px;*/
        }
        .comp{
            float:right;
            margin-right:2%;
        }
        .r2{
            /*background:#a7a7b2;*/
            border-top-left-radius:10px;
            border-top-right-radius:10px;
            width:100%
        }
        ul{
            display:inline-flex;
            list-style-type:none;
            overflow:hidden;
            background:linear-gradient(rgb(137, 166, 185), rgb(225, 97, 97));
            border-bottom-left-radius:10px;
            border-bottom-right-radius:10px;
            border-top-right-radius:10px;
            border-top-left-radius:10px;
            
        }
        li{
            float:left;
        }
        li a{
            display:block;
            padding:12px 10px;
            color:aliceblue;
            text-align:center;
            text-decoration:none;
        }
        li.lr21
        {
           display:inline-block;
        }
        li a, .lar21{
            display:inline-block;
            color:ghostwhite;
            text-align:center;
            padding:15px 18px; 
            text-decoration:none;
        }
        .adr21
        {
            display:none;
            position:absolute;
            background-color: #29a2e1;
    /*min-width: 220px;*/
    
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        }
        .adr21 a{
            display:flex;
            padding: 12px 16px;
            text-decoration: none;
            text-align: left;
        }
        .show{display:flex}
        .close{display:none}
         #Footer{
            margin-top:40.8%;
            color:antiquewhite;
            height:46px;
            width:100%;
            vertical-align:bottom;
            background-repeat:repeat-x;
            background:#999;
        }
        #footerleft{
            padding-left:20px;
            padding-top:10px;
            float:left; 
        }
    </style>
    <script>
        function dc1() {
            document.getElementById("db1").classList.toggle("show");
        }
        function tc1() {
            document.getElementById("tc1").classList.toggle("show")
        }
        function rpt1() {
            document.getElementById("rpt1").classList.toggle("show")
        }
        window.onclick = function (e) {
            if (!e.target.matches('.lar21')) {

                var dropdowns = document.getElementsByClassName("adr21");
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
    <div id="R1" class="r1">
        <strong>Easytask Help Desk.</strong> 
        <strong class ="comp">Medstream Technologies</strong>
        </div>
        <br />
        <br />
        <div id="r2" class="r2">
            <ul class="r21" >
                <li class="lr21" >
                    <a class="lar21" href="#" onclick="dc1()">Dashboard</a>
                   <div class="adr21" id="db1">
                       <a href="Dashboard.aspx"  target="_parent" id="db">Click To View Dashboard</a>
                   </div>
                </li>
                <li class="lr21">
                    <a target="_self" href="#" class="lar21" onclick="tc1()">Ticket</a>
                    <div class="adr21" id="tc1">
                        <a href="TicketDetails.aspx" target="_parent" id="a1">All Ticket</a>
                        <a href="AssignTicket.aspx" target="_parent">Assigned Tickets</a>
                        <a href="UnassignTicket.aspx" target="_parent">Unassigned Tickets</a>
                    </div>
                </li>
                <li class="lr21">
                    <a href="#" class="lar21" onclick="rpt1()">Reports</a>
                    <div class="adr21" id="rpt1">
                        <a href="#" target="_parent" id="rp1">All Open Ticket Reports</a>
                        <a href="#" target="_parent" id="rp2">All Pending Ticket Reports</a>
                        <a href="#" target="_parent" id="rp3">All Closed Ticket Reports</a>
                    </div>
                </li>
            </ul>
        </div>
        <div id ="Footer" >
            <div id="footerleft">
                <a href="Login.aspx">Help Desk Software</a>
                "© 2016 Medstream Technologies"
            </div>
       </div>
    </form>
</body>
</html>
