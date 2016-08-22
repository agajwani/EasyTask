<%@ Page Language="C#" AutoEventWireup="true" Inherits="SalutaionMaster" Codebehind="SalutaionMaster.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Salutation Master</title>
    <style>
       body{
            background:rgb(12, 97, 33);
           background-repeat: no-repeat;
    background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
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
            font-family:'Franklin Gothic';
            color:ghostwhite;
            font-size:25px;
           width:700px;
           height:250px;
            margin-left:auto;
            margin-right:auto;
            background-color:#2c3e50;
            box-shadow: 10px 10px black;
        }
        .button{
           font-family:'Franklin Gothic';
            font-size:20px;
            margin-left:135px;
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
        .button:hover,
        .button:active,
        .button:focus{
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
</head>
<body>
   <div id="back" class="back"><asp:Label ID="usercode" runat="server" Text="SalutationMaster" Font-Bold="true"></asp:Label>
       <strong class="session"><%=Session["Uid"].ToString() %></strong>
   </div>
     
    <br />
    <br />
        <br />
    <form id="form1" runat="server">
    <div id="info" class="info">
        <br />
        <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    Salutation Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtsalutation" runat="server" Width="259px" Height="30px" Font-Size="25px" ToolTip="Enter Salutaion" TabIndex="1"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Gender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:DropDownList ID="ddlgender" runat="server" Width="259px" Height="30px" Font-Size="25px" ToolTip="Select Gender" TabIndex="2">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btnAdd" CssClass="button" runat="server" Text="Add" ToolTip="Click here to add " TabIndex="3" OnClick="btnAdd_Click" Width="81px"/>
        &nbsp;
        <asp:Button ID="btnview" CssClass="button" runat="server" Text="Edit" ToolTip="Click here to View &amp; Edit" TabIndex="3"  Width="81px" OnClick="btnview_Click"/>
        <asp:Button ID="btnCancel" CssClass="button" runat="server" Text="Cancel" ToolTip="Click here to cancel" TabIndex="4" OnClick="btnCancel_Click" Width="81px"/>
    </div>
    </form>
</body>
</html>
