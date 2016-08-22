<%@ Page Language="C#" AutoEventWireup="true" Inherits="SalutationMasterUpdate" Codebehind="SalutationMasterUpdate.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Salutation Master Update </title>
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
           height:400px;
            margin-left:auto;
            margin-right:auto;
            background-color:#2c3e50;
            box-shadow: 10px 10px black;
        }
        .infoc{
            font-family:'Franklin Gothic';
            font-size:25px;
            margin-left:250px;
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
    <div id="back" class="back"><strong> Salutation Master</strong>
        <strong class="session"><%=Session["Uid"].ToString() %></strong>
    </div>
    <div id="ur" class="uri">
            <asp:Label ID="uri" runat="server" Text="SalutationMasterUpdate" Visible="false"></asp:Label>
        </div>
    <br />
    <br />
    <br />
    <form id="form1" runat="server">
    <div id="info" class="info">
        <asp:SqlDataSource ID="salutation" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [SalutationName], [SalutationCode] FROM [SalutationHeader]"></asp:SqlDataSource>
        
        <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    Salutation Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlsalutation" DataSourceID="salutation" DataTextField="SalutationName" DataValueField="SalutationName" runat="server" Width="259px" Height="30px" Font-Size="25px" ToolTip="Select saluation name to change" TabIndex="1" AutoPostBack="True" OnSelectedIndexChanged="ddlsalutation_SelectedIndexChanged"></asp:DropDownList>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Modified Salutation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtmodifiedsalutation" runat="server" Width="259px" Height="30px" Font-Size="25px" ToolTip="Type new salutation name" TabIndex="2"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlgender" runat="server" Width="259px" Height="30px" Font-Size="25px" ToolTip="Select gender" TabIndex="3">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:DropDownList>
         <br />
            <br />
            <asp:CheckBox ID="cbactive" runat="server" CssClass="infoc" Text="Inactive Salutation" ToolTip="Inactive Salutation" TabIndex="4" />
        <br />
        <br />
        <asp:Button ID="btnupdate" CssClass="button" runat="server" Text="Update" ToolTip="Click here to update" TabIndex="5" OnClick="btnupdate_Click"/>
        <asp:Button ID="btnCancel" CssClass="button" runat="server" Text="Cancel" ToolTip="Click here to cancel" TabIndex="6" OnClick="btnCancel_Click"/>
    </div>
    </form>
</body>
</html>
