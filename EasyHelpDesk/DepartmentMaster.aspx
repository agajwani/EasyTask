<%@ Page Language="C#" AutoEventWireup="true" Inherits="DepartmentMaster" Codebehind="DepartmentMaster.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Department Master</title>
    <style>
       body{
           height: 100%;
             /*background-repeat: no-repeat;
             background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
             /*background-color:rgb(12, 97, 33);*/
             background:#f8f8f8;
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
           background:#2c3e50;
            padding: 10px;
            width: 800px;
            height:330px;
            margin: 40px auto ;
            border-radius: 4px;
            box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
            font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
           font-size:25px;
            color:#ffffff;
            align-items:center;
       }
       .infoc{
            font-family:'Franklin Gothic';
            font-size:25px;
            margin-left:300px;
        }
       .button{
           font-family:'Franklin Gothic';
            font-size:20px;
            margin-left:100px;
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
        .infot{
            font-family:'Franklin Gothic';
            font-size:25px;
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
    <form id="form1" runat="server">
    <div id="head" class="head">
        <asp:Label ID="Department" Text="Department Master" runat="server" Font-Bold="true"></asp:Label>
        <strong class="session"><%=Session["TUID"].ToString() %></strong>
        <br />
        <br />
        <br />
    </div>
    <div id="info" class="info">
         <asp:SqlDataSource ID="location" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT DISTINCT [LocationID], [LocationName] FROM [LocationHeader]">
             <SelectParameters>
                 <asp:Parameter DefaultValue="0" Name="ActiveStatus" Type="Int32" />
             </SelectParameters>
         </asp:SqlDataSource>
        <br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:TextBox ID="txtdepartment" runat="server" Width="259px" Height="30px" Font-Size="25px" ToolTip="Fill Required to fill"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;Department Category&nbsp;&nbsp; <asp:DropDownList ID="ddldepartcategory"  runat="server" CssClass="infot" Width="268px" Height="30px" >
             <asp:ListItem>Admin</asp:ListItem>
             <asp:ListItem>Medical</asp:ListItem>
        </asp:DropDownList> &nbsp;<br />
        <br />
       <%-- &nbsp;&nbsp;&nbsp;&nbsp;
        Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddllocation" DataSourceID="location" DataTextField="LocationName" DataValueField="LocationID" CssClass="infot" runat="server" Width="265px" Height="30px" style="margin-left: 0px"></asp:DropDownList>
        <br />
        <br />--%>
        <asp:Button ID="btnadd" runat="server" Text="Add" CssClass="button" ToolTip="Click here to Add" OnClick="btnadd_Click" />
        <asp:Button ID="btnedit" runat="server" Text="Edit" CssClass="button" ToolTip="Edit" OnClick="btnedit_Click" />
        <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="button" ToolTip="Click here to Cancel" OnClick="btncancel_Click" />
    </div>
    </form>
</body>
</html>
