<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketTypeUpdate.aspx.cs" Inherits="test1.TicketTypeUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Type Update</title>
    <style>
        body {
             /*background:rgb(12, 97, 33);
             background-repeat: no-repeat;
             background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
             height:100%;
             background-color:#f8f8f8;
        }
        #Head {
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
           height:350px;
            margin-left:auto;
            margin-right:auto;
            background-color:#2c3e50;
            box-shadow: 10px 10px black;
        }
        .infot{
            width:259px;
            height:30px;
            font-size:25px;
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
    <script type="text/javascript">
        history.forward();
    </script>
</head>
<body>
    <div id="Head" class="Head"><asp:Label ID="tickettype" runat="server" Text="Ticket Type Update" Font-Bold="true"></asp:Label>
        <strong class="session"><%=Session["TUID"].ToString() %></strong>
    </div>
     <asp:Label ID="uri" runat="server" Text="Tickettypeupdate" Visible="false"></asp:Label>

    <br />
    <br />
    <br />
    <form id="form1" runat="server">
    <div id="info" class="info">
         <br />
         <br />
        
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         
         Ticket Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
         <asp:DropDownList ID="ddltype" runat="server" Width="259px" Height="30px" Font-Size="25px" ToolTip="Select Ticket Type" AutoPostBack="True" DataSourceID="Tcktype" DataTextField="Tcktyp" DataValueField="Tcktyp" OnSelectedIndexChanged="ddltype_SelectedIndexChanged"></asp:DropDownList>
         <asp:SqlDataSource ID="Tcktype" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [Tcktyp] FROM [TicketTypeHeader]"></asp:SqlDataSource>
         <br />
         <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         Modified Ticket Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:TextBox ID="txtmodtype" runat="server" CssClass="infot" ToolTip="Fill Required" ></asp:TextBox>
         <br />
         <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;              
         <asp:CheckBox ID="cbactive" Text="Inactive Ticket Type" CssClass="infoc" runat="server" />
         <br />
         <br />
          <asp:Button ID="btnupdate" Text="Update" CssClass="button" runat="server" ToolTip="Update" OnClick="btnupdate_Click" />
        <asp:Button ID="btncancel" Text="Cancel" CssClass="button" runat="server" ToolTip="Cancel" OnClick="btncancel_Click" />
    </div>
    </form>
</body>
</html>
