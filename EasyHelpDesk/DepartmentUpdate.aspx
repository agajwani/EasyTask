<%@ Page Language="C#" AutoEventWireup="true" Inherits="DepartmentUpdate" Codebehind="DepartmentUpdate.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Department Master Update</title>
    <style>
        body{
                background:rgb(12, 97, 33);
           background-repeat: no-repeat;
    background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
            height:100%;
        }
        .head{
             
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
           height:550px;
            margin-left:auto;
            margin-right:auto;
            background-color:#2c3e50;
            box-shadow: 10px 10px black;
        }
         .Button{
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
        .Button:hover,
        .Button:active,
        .Button:focus{
            color:rgb(12, 97, 33);
        }
        .infot{
            font-family:'Franklin Gothic';
            font-size:25px;
        }
        .infoc{
            font-family:'Franklin Gothic';
            font-size:25px;
            margin-left:250px;
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
    <div id="head" class="head">
        Department Master Update
        <strong class="session"><%=Session["UId"].ToString() %></strong>
        <br />
        <br />
        <br />
    </div>
    <form id="form1" runat="server">
        <br />
            <asp:Label ID="uri" runat="server" Text="DepartmentMasterUpdate" Visible="false"></asp:Label>
        <br />
        <br />
        <br />
    <div id="info" class="info">
        <asp:SqlDataSource ID="location" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [LocationName], [LocationID] FROM [LocationHeader]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="deptname" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [DeptName] FROM [Department]" ></asp:SqlDataSource>
        <br />
        <br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddldeptname" DataSourceID="deptname" DataTextField="DeptName" DataValueField="DeptName" runat="server" ToolTip="Select the Department Name" CssClass="infot" Width="268px" Height="30px" AutoPostBack="True" OnSelectedIndexChanged="ddldeptname_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Modified Department Name 
        <asp:TextBox ID="txtmoddept" runat="server" Width="259px" Height="30px" Font-Size="25px" ToolTip="Fill Required to fill"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Department Category&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="ddldepartcategory"  runat="server" CssClass="infot" Width="268px" Height="30px" AppendDataBoundItems="true" >
             <asp:ListItem>Select</asp:ListItem>
             <asp:ListItem>Admin</asp:ListItem>
             <asp:ListItem>Medical</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtdeptcat" runat="server" Width="259px" Height="30px" Font-Size="25px" AutoPostBack="true" ReadOnly="True" ></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddllocation" DataSourceID="location" DataTextField="LocationName" DataValueField="LocationID" runat="server" ToolTip="select the Location" CssClass="infot" Width="268px" Height="30px">
            <asp:ListItem Value="0">Select</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="txtlocation" runat="server" Width="259px" Height="30px" Font-Size="25px" AutoPostBack="true" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        <asp:CheckBox ID="cbactive" Text="Inactive Department" CssClass="infoc" ToolTip="To keep inactive Department" runat="server" />
        <br />
        <br />
        <asp:Button ID="btnupdate" CssClass="Button"  runat="server" Text="Update" TabIndex="4" OnClick="btnupdate_Click" />
        <asp:Button ID="btncancel" CssClass="Button" runat="server" Text="Cancel" TabIndex="5" OnClick="btncancel_Click" />
    </div>
    </form>
</body>
</html>
