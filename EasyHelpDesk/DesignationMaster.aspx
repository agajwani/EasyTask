<%@ Page Language="C#" AutoEventWireup="true" Inherits="DesignationMaster" Codebehind="DesignationMaster.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Desigantion Master</title>
    <style>
        body{
            /*background:rgb(12, 97, 33);
           background-repeat: no-repeat;
    background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
            background:#f8f8f8;
            height:100%;
            

        }
        #back{
            
            padding:15px;
            text-align:center;
            height: 0px;
            color:#2c3e50;
             font-family:'Franklin Gothic';
            font-size:45px;
        }
        .info{
            margin-left:auto;
            margin-right:auto;
            font-size:25px;
            width:550px;
            height:250px;
            font-family:'Franklin Gothic';
            background-color:#2c3e50;
            box-shadow:10px 10px black;
            color:ghostwhite;
        }
        .uinfo{
            font-family:sans-serif;
            font-size:18px;
            width:287px;
            color:white;
        }
        .Button{
            font-family:'Franklin Gothic';
            font-size:20px;
            margin-left:90px;
            border-bottom-left-radius:10px;
            border-bottom-right-radius:10px;
            border-top-left-radius:10px;
            border-top-right-radius:10px;
            box-shadow: 10px 10px black;
            cursor:pointer;
            /*width:123px;*/
             background-color:rgb(104, 145, 162);
           font-weight:bold;
           color:white;

        }
        .Button:hover,
        .Button:active,
        .Button:focus{
            color:rgb(12, 97, 33);
        }
        .session{
            float:right;
    color:ghostwhite;
    font-size:35px;
    font-family:Calibri;
    padding-right:105px;
        }

    </style>
    <script type="text/javascript">
        history.forward();
    </script>
</head>

<body>
    <div id="back" class="back">
    <asp:Label ID="Designation" runat="server" Text="Designation Master" Font-Bold="true"></asp:Label>
        <strong class="session"><%=Session["TUID"].ToString() %></strong>
    </div>
    <form id="form1" runat="server">
        <br />
       <br />
        <br />
        <br />
        <div id="info" class="info">
            
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Designation &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtdesination" runat="server" ToolTip="Enter Designation"  Width="259px" Height="30px" Font-Size="25px" TabIndex="1"></asp:TextBox>
            <br />
            <br />
            
           <asp:Button ID="btnadd" CssClass="Button"  runat="server" Text="Add" TabIndex="2" OnClick="btnadd_Click" Width="80px" />
                        
           <asp:Button ID="btnedit" CssClass="Button"  runat="server" Text="Edit" TabIndex="2" OnClick="btnedit_Click" Width="80px" />
            
            <asp:Button ID="btnclear" CssClass="Button" runat="server" Text="Cancel" TabIndex="3" OnClick="btnclear_Click" Width="80px" />
            <br />
            <br />
            
        </div>
    </form>
</body>
</html>
