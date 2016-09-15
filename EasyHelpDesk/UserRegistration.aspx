<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="EasyHelpDesk.UserRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <style>
        body{
            /*background:#c1bdba;*/
            height: 100%;
    /*background-repeat: no-repeat;
    background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
    background:#f8f8f8;
               }
        #BACK {
            /*width: 499px;*/
            padding:15px;
            text-align:center;
            height: 0px;
            color:#2c3e50;
             font-family:'Franklin Gothic';
            font-size:45px;
        }
        .info1{
            background:#2c3e50;
  padding: 10px;
  max-width: 750px;
  margin: 40px auto ;
  border-radius: 4px;
  box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
  font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
  font-size:16px;
  color:#ffffff;
        }
        .infot{
            font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            font-size:18px;
            border-bottom-left-radius :5px;
            border-bottom-right-radius:5px;
            border-top-left-radius:5px;
            border-top-right-radius:5px;

        }
        .infob{
            font-family :'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-size:20px;
            border-bottom-left-radius:10px;
            border-bottom-right-radius:10px;
            border-top-left-radius:10px;
            border-top-right-radius:10px;
            /*background-color:#199f5e;*/
            background-color:rgb(104, 145, 162);
           font-weight:bold;
           cursor:pointer;
           color:white;
           box-shadow:10px 10px black;
        }
        .infob:hover,
        .infob:active,
        .infob:focus{
            color:rgb(12, 97, 33);
        }
        .uri{
            visibility:hidden;
        }
        .pannel{
            width:746px;
            /*margin-top:15px;*/
            padding-top:10px;
            background-color:bisque;
            border-bottom-left-radius:10px;
            border-bottom-right-radius:10px;
            border-top-left-radius:10px;
            border-top-right-radius:10px;
            height:75px;
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
        function NumberOnly() {
            var AsciiValue = event.keyCode
            if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
                event.returnValue = true;
            else
                event.returnValue = false;
        }
        history.forward();
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="BACK" class="backc">
    
        Sign Up For EasyTask.
       <strong class="session"> <%=Session["TUid"].ToString() %> </strong>
    </div>
        <br />
        <br />
        <div id="ur" class="uri">
            <asp:Label ID="uri" runat="server" Text="UserRegistrationMaster"></asp:Label>
        </div>
        <div id="info" class="info1">
            
            
            
            
            <asp:Panel ID="Panel1" CssClass="pannel" runat="server"  BorderStyle="Inset" >
            <asp:Button ID="urbsignup" runat="server" CssClass="infob" OnClick="urbsignup_Click" Text="Sign Up" Width="123px" />
            <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="urbedit" runat="server" CssClass="infob" Text="Edit User" Width="123px" OnClick="urbedit_Click" />--%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="urbclear" runat="server" CssClass="infob" OnClick="urbclear_Click" Text="Clear" Width="123px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="urbcancel" runat="server" CssClass="infob" OnClick="urbcancel_Click" Text="Cancel" Width="123px" />
            &nbsp;&nbsp;&nbsp;&nbsp;    
            <asp:Button ID="urbview" runat="server" CssClass="infob" Text="View" Width="110px" OnClick="urbview_Click" />

</asp:Panel>
            
            <br />
            First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:DropDownList ID="DDLsal" CssClass="infot" ToolTip="Selet Salutation" runat="server" Width="142px" DataSourceID="dssalutation" DataTextField="SalutationName" DataValueField="SalutationName">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="urtfname" CssClass="infot"  ToolTip="This Is Required Feild" runat="server" Width="259px"></asp:TextBox>
            &nbsp;&nbsp;<asp:SqlDataSource ID="dssalutation" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [SalutationName] FROM [SalutationHeader]"></asp:SqlDataSource>
            <br />
            <br />
            <br />
            Middle Name 
            <asp:TextBox ID="urtmname" CssClass="infot" ToolTip="Fill Your Middle Name" runat="server" Width="259px"></asp:TextBox>
            <br />
            <br />
            <br />
            Last Name&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="urtlname"  CssClass="infot" ToolTip="This is required feild" runat="server" Width="259px"></asp:TextBox>
            <br />
            <br />
            <br />
            Department ID 
            <asp:DropDownList ID="DDLdeptid" CssClass="infot" ToolTip="Select Department" runat="server" Width="237px" DataSourceID="dsdid" DataTextField="DeptName" DataValueField="DeptId">
            </asp:DropDownList>
            <asp:SqlDataSource ID="dsdid" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [DeptName], [DeptId] FROM [Department]"></asp:SqlDataSource>
            <br />
            <br />
            <br />
            Designation&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="ddldesg" CssClass="infot" ToolTip="Selet Designation" runat="server" Width="237px" DataSourceID="dsdesignation" DataTextField="DesignationName" DataValueField="DesignationId">
            </asp:DropDownList> &nbsp;&nbsp;<asp:SqlDataSource ID="dsdesignation" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [DesignationName], [DesignationId] FROM [Designation]"></asp:SqlDataSource>
            Default Role&nbsp;&nbsp;<asp:DropDownList ID="ddldeptrole" CssClass="infot" ToolTip="Selet Departmental role" runat="server" Width="237px" >
                <asp:ListItem>Select</asp:ListItem>
                <asp:ListItem>Requester</asp:ListItem>
                <asp:ListItem>Service Agent</asp:ListItem>
                <asp:ListItem>Departmental Manager</asp:ListItem>
                <asp:ListItem>Global Manager</asp:ListItem>
            </asp:DropDownList>    
            &nbsp;&nbsp;&nbsp;    
            <br />
            <br />
            <br />
            Mobile No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="urtmno1" CssClass="infot"  ToolTip="Fill Your Mobile Number" onkeypress="Numberonly()" MaxLength="12" runat="server" TextMode="Phone"></asp:TextBox>
            &nbsp; Extn No <asp:TextBox ID="urtmno2" CssClass="infot"  ToolTip="Fill Your Mobile Number" onkeypress="Numberonly()" MaxLength="12" runat="server" TextMode="Phone"></asp:TextBox>
            <br />
            <br />
            <br />
            Phone No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="urtph1" CssClass="infot"  ToolTip="Fill Your Phone Number" onkeypress="Numberonly()" MaxLength="12" runat="server" TextMode="Phone"></asp:TextBox>
            &nbsp; Phone No2&nbsp; <asp:TextBox ID="urtph2" CssClass="infot"  ToolTip="Fill Your Phone Number" runat="server" onkeypress="Numberonly()" MaxLength="12" TextMode="Phone"></asp:TextBox>
            <br />
            <br />
            <br />
            Email ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="urtemail" CssClass="infot"  ToolTip="Fill Your Email ID" runat="server" TextMode="Email"></asp:TextBox>
            &nbsp;
            <asp:CheckBox ID="urcmsl" runat="server" Text="Allow Master Login" ToolTip="Allow Master Login" />
            <br />
            <br />
            <br />
            Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="urtuname" CssClass="infot"  ToolTip="This Is Required Feild" runat="server"></asp:TextBox>
            &nbsp;&nbsp; Password&nbsp; <asp:TextBox ID="urtpass" CssClass="infot"  ToolTip="This Is Required Feild"  runat="server" TextMode="Password"></asp:TextBox>
            <asp:RegularExpressionValidator ID="passval" runat="server" ErrorMessage="Password Must Be At Least 6 Characters" ControlToValidate="urtpass" ValidationExpression="^[a-zA-Z0-9\s]{6}$"></asp:RegularExpressionValidator>
            
        </div>
    </form>
</body>
</html>
