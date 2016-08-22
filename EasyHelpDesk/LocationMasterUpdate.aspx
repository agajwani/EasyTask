<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocationMasterUpdate.aspx.cs" Inherits="test1.LocationMasterUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Location Master Update</title>
    <style>
        body {
             background:rgb(12, 97, 33);
             background-repeat: no-repeat;
             background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
             height:100%;
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
           height:450px;
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
    <div id="Head" class="Head"><asp:Label ID="Location" runat="server" Text="Location Master Update" Font-Bold="true"></asp:Label>
        <strong class="session"><%=Session["Uid"].ToString() %></strong>
    </div>
    <br />
    <br />
    <form id="form1" runat="server">
        <asp:Label ID="uri" runat="server" Text="locationmasterupdate" Visible="False"></asp:Label>
    <br />
    <div id="info" class="info">
        <asp:SqlDataSource ID="loc" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [LocationName], [LocationID] FROM [LocationHeader]"></asp:SqlDataSource>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Location Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlloc" DataSourceID="loc" DataTextField="LocationName" DataValueField="LocationID" Width="259px" Height="30px" Font-Size="25px" runat="server" AutoPostBack="True" OnTextChanged="ddlloc_SelectedIndexChanged"></asp:DropDownList>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Modified Location Name&nbsp; <asp:TextBox ID="txtmodloc" runat="server" CssClass="infot" ></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Location Category&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtpercat" runat="server" CssClass="infot" AutoPostBack="true"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="cbactive" runat="server" CssClass="infoc" Text="Inactive Location" ToolTip="Inactive Salutation" AutoPostBack="true" />
        &nbsp;
        <br />
        <br />
        <asp:Button ID="btnupdate" Text="Update" CssClass="button" runat="server" OnClick="btnupdate_Click" />
        <asp:Button ID="btncancel" Text="Cancel" CssClass="button" runat="server" OnClick="btncancel_Click" />

    </div>
    </form>
</body>
</html>
