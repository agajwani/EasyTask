<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="test1.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
    <style>
        body{
            background:rgb(12, 97, 33);
            background-repeat: no-repeat;
            background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
            height:100%;
        }
        #head{
                padding:15px;
                text-align:center;
                height: 0px;
                color:#2c3e50;
                font-family:'Franklin Gothic';
                font-size:45px;
        }
         .info{
                font-family:'Franklin Gothic';
                color:ghostwhite;
                font-size:25px;
                width:700px;
                height:360px;
                margin-left:auto;
                margin-right:auto;
                background-color:#2c3e50;
         }
         .button{
                font-family:'Franklin Gothic';
                font-size:20px;
                margin-left:150px;
                border-bottom-left-radius:10px;
                border-bottom-right-radius:10px;
                border-top-left-radius:10px;
                border-top-right-radius:10px;
                box-shadow: 10px 10px black;
                cursor:pointer;
                width:123px;
                background-color:rgb(104, 145, 162);
                font-weight:bold;
                color:white;
         }
         .button:hover,
        .button:active,
        .button:focus{
                color:rgb(12, 97, 33);
        }
         infot{
                font-family:'Franklin Gothic';
                font-size:25px;
         }
    </style>
</head>
<body>
    <div id="head" class="head">
        <asp:Label ID="changepwd" Text="Change Password" Font-Bold="true" runat="server"></asp:Label>   
    </div>
    <br />
    <br />
    <br />
    <form id="form1" runat="server">
    <div id="info" class="info">
         
        <asp:SqlDataSource ID="username" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [UserLoginId] FROM [UserInfo]"></asp:SqlDataSource>
        <br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        User Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:DropDownList ID="ddlusername" runat="server" DataSourceID="username" DataTextField="UserLoginId" DataValueField="UserLoginId" CssClass="infot" ToolTip="Select designation" Width="259px" Height="30px" Font-Size="25px" ></asp:DropDownList>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Current Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtcurrpwd" runat="server" TextMode="Password" ToolTip="Fill is Required" Width="259px" Height="30px" Font-Size="25px"></asp:TextBox>
       
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        New Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtnewpwd" runat="server" TextMode="Password" ToolTip="Fill is Required" Width="259px" Height="30px" Font-Size="25px"></asp:TextBox>
       
        <br />
        <br />
        <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="button" OnClick="btnsave_Click" />
        <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="button" OnClick="btncancel_Click" />
    </div>
    </form>
</body>
</html>
