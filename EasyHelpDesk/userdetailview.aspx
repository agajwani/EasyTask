<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userdetailview.aspx.cs" Inherits="EasyHelpDesk.userdetailview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Sign up Users</title>
    <style>
        body
        {
        height:100%;
        background: rgb(12, 97, 33); 
        background-repeat: no-repeat;
    background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
        
        }
        .panel{
            background:#2c3e50;
  padding: 10px;
  width: 1550px;
  margin: 40px auto ;
  border-radius: 4px;
  box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
  font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
  font-size:16px;
  color:#ffffff;
        }
        .head{
             padding:15px;
            text-align:center;
            height: 0px;
            color:#2c3e50;
             font-family:'Franklin Gothic';
            font-size:45px;
        }
        .find
        {
            width:580px;
            /*margin:150px;*/
            padding:10px;
            background-color:bisque;
            border-bottom-left-radius:10px;
            border-bottom-right-radius:10px;
            border-top-left-radius:10px;
            border-top-right-radius:10px;
            height:115px;
            color:black;
            /*font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;*/
            font-size:18px;
        }
        .drp{
            /*width:105px;*/
            font-family:sans-serif;
            font-size:18px;
            border-bottom-left-radius:5px;
            border-bottom-right-radius:5px;
            border-top-right-radius:5px;
            border-top-left-radius:5px;
        }
        .text{
            font-family:sans-serif;
            font-size:18px;
            border-bottom-left-radius:5px;
            border-bottom-right-radius:5px;
            border-top-right-radius:5px;
            border-top-left-radius:5px;
        }
        .button
        {
            font-family:sans-serif;
            font-size:18px;
            border-bottom-left-radius:5px;
            border-bottom-right-radius:5px;
            border-top-right-radius:5px;
            border-top-left-radius:5px;
             background-color:rgb(104, 145, 162);
           font-weight:bold;
           cursor:pointer;
           color:white;
           box-shadow:10px 10px black;
        }
        .button:hover
        {
            color:rgb(12, 97, 33);

        }
    </style>
    <script type="text/javascript">
        history.forward();
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="head" id="heading">
        User Data View.
    </div>
        <br />
        <br />
        <div class="panel" id =" gdvbox">
      
          <div class ="find" id="findinfo">
                <strong>Enter The Search Value:</strong> <asp:DropDownList ID="ddlfindlist" CssClass="drp" runat="server" Height="23px" Width="127px">
                    <asp:ListItem Value="UserSalutation">Salutation</asp:ListItem>
                    <asp:ListItem Value="UserFirstName">Firstname </asp:ListItem>
                    <asp:ListItem Value="MasterLogin">Master Allowed</asp:ListItem>
                    <asp:ListItem Value="UserOtherName">Middle Name</asp:ListItem>
                    <asp:ListItem Value="UserLastName">Last Name</asp:ListItem>
                    <asp:ListItem Value="DeptName">Department Name</asp:ListItem>
                    <asp:ListItem Value="DesignationName">Designation Name</asp:ListItem>
                    <asp:ListItem Value="UserMobileNo1">Mobile Number</asp:ListItem>
                    <asp:ListItem Value="UserTelephone1">Phone Number</asp:ListItem>
                    <asp:ListItem Value="UserEmailId">Email Id</asp:ListItem>
                    <asp:ListItem Value="UserLoginId">Username</asp:ListItem>
                    <asp:ListItem Value="UserIsLocked">Locked User</asp:ListItem>
                    <asp:ListItem Value="DocumentDate">Created Date</asp:ListItem>
                    <asp:ListItem Value="ActiveStatus">Active Status</asp:ListItem>
                </asp:DropDownList>
            

            &nbsp;<asp:TextBox ID="ftdata" runat="server" CssClass="text"></asp:TextBox>
              <br />
              <asp:DropDownList ID="ddlEXPORT" runat="server" CssClass="text">
                  <asp:ListItem>PDF</asp:ListItem>
                  <asp:ListItem>EXCEL</asp:ListItem>
                  <asp:ListItem>WORD</asp:ListItem>
                </asp:DropDownList>
                <h2>
                    <asp:Button ID="fbfind" runat="server" Text="Find" OnClick="fbfind_Click" CssClass="button" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="fbrefresh" runat="server" CssClass="button" Text="Refresh" OnClick="fbrefresh_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="fbexport" runat="server" CssClass="button" Text="Export" OnClick="fbexport_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Fbcancle" runat="server" CssClass="button" Text="Cancle" OnClick="Fbcancle_Click" />
                </h2>
            </div>
            <br />
            <asp:GridView ID="vgdv" runat="server" AllowPaging="True" OnRowCreated="vgdv_RowCreated" OnPageIndexChanging="vgdv_PageIndexChanging" OnRowCommand="vgdv_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                        <asp:linkbutton id="linkbutton1" runat="server" text="Edit"  ForeColor="GhostWhite" postbackurl='<%#"~/usereditdtl.aspx?id="+Eval("username") %>'></asp:linkbutton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
                <HeaderStyle BackColor="#CA5100" BorderColor="White" BorderStyle="Groove" />
                <RowStyle BorderStyle="Solid" />
            </asp:GridView>
            
            
    </div>
        
    </form>
</body>
</html>
