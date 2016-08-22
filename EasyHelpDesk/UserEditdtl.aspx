<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserEditdtl.aspx.cs" Inherits="EasyHelpDesk.UserEditdtl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit SignUp</title>
    <style>
        body{
             height: 100%;
             background-repeat: no-repeat;
             background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
             background-color:rgb(12, 97, 33);
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
            margin-left: 0px;
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
        .deptcss{
            visibility:hidden;
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
    User Edit View
       <strong class="session"><%=Session["uid"].ToString() %></strong>
    </div>
        <div id="ur" class="uri">
            <asp:Label ID="uri" runat="server" Text="Userdetailedit" Visible="false"></asp:Label>
        </div>
        <br />
        <br />
        <div id="info" class="info">
            <asp:Panel ID="Panel1" CssClass="pannel" runat="server"  BorderStyle="Inset" >
            <asp:Button ID="urbsave" runat="server" CssClass="infob"  Width="123px" Text="Save" OnClick="urbsave_Click" PostBackUrl="~/UserEditdtl.aspx"/>
                <%--OnClientClick="return false"/>--%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="urbcancel" runat="server" CssClass="infob" Text="Cancel" Width="123px" OnClick="urbcancel_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </asp:Panel>
           <br />
            UserId&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:TextBox ID="urtuserid" CssClass="infot"  ToolTip="This Is Required Field" runat="server" Width="259px" ReadOnly="True" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
            <br />
            <br />
            <br />
            First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:DropDownList ID="ddlsal" runat="server" CssClass="infot" DataSourceID="uesalds" DataTextField="SalutationName" DataValueField="SalutationName" AppendDataBoundItems="true">
                <asp:ListItem Value="0">Select</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="uesalds" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [SalutationName] FROM [SalutationHeader]"></asp:SqlDataSource>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:TextBox ID="urtfname" runat="server" CssClass="infot" ValidateRequestMode="Disabled" Width="258px"></asp:TextBox>
            &nbsp;<br />
            <br />
            <br />
            Middle Name&nbsp; 
            <asp:TextBox ID="urtmname" CssClass="infot" ToolTip="Fill Your Middle Name" runat="server" Width="259px"></asp:TextBox>
            <br />
            <br />
            <br />
             Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:TextBox ID="urtlname"  CssClass="infot" ToolTip="This is required field" runat="server" Width="259px"></asp:TextBox>
            <br />
            <br />
            <br />
             Department&nbsp;&nbsp;
            <asp:DropDownList ID="ddldept" runat="server" CssClass="infot" DataSourceID="uedptds" DataTextField="DeptName" DataValueField="DeptId" Width="238px" AppendDataBoundItems="True">
                <asp:ListItem Value="0">Select</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="uedptds" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [DeptId], [DeptName] FROM [Department]"></asp:SqlDataSource>
            <asp:CheckBox ID="cbinactive" Text="Inactive user" runat="server" />
            &nbsp;
            <asp:TextBox ID="uetdept0" runat="server" CssClass="infot" Width="177px" AutoPostBack="True" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="uetdept" runat="server" CssClass="deptcss" Width="48px" AutoPostBack="True" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            <br />
            Designation&nbsp;&nbsp; 
            <asp:DropDownList ID="ddldesg" runat="server" CssClass="infot" DataSourceID="uedesgds" DataTextField="DesignationName" DataValueField="DesignationId" Width="238px" AppendDataBoundItems="true">
                <asp:ListItem Value="0">Select</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="uedesgds" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [DesignationId], [DesignationName] FROM [Designation]"></asp:SqlDataSource>
             &nbsp;<asp:TextBox ID="uetdesg0" runat="server" CssClass="infot" Width="176px" ReadOnly="True"></asp:TextBox>
             &nbsp;<asp:TextBox ID="uetdesg" runat="server" CssClass="deptcss" Width="99px" ReadOnly="True"></asp:TextBox>
             <br />
            <br />
            <br />
            Mobile No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="urtmno1" CssClass="infot"  ToolTip="Fill Your Mobile Number" runat="server" TextMode="Phone"></asp:TextBox>
            &nbsp; Mobile No2 <asp:TextBox ID="urtmno2" CssClass="infot"  ToolTip="Fill Your Mobile Number" runat="server" TextMode="Phone"></asp:TextBox>
            <br />
            <br />
            <br />
            Phone No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="urtph1" CssClass="infot"  ToolTip="Fill Your Phone Number" runat="server" TextMode="Phone"></asp:TextBox>
            &nbsp; Phone No2&nbsp; <asp:TextBox ID="urtph2" CssClass="infot"  ToolTip="Fill Your Phone Number" runat="server" TextMode="Phone"></asp:TextBox>
           <br />
            <br />
            <br />
            Email ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:TextBox ID="urtemail" CssClass="infot"  ToolTip="Fill Your Email ID" runat="server" TextMode="Email"></asp:TextBox>
            &nbsp;
            <asp:CheckBox ID="urcmsl" runat="server" Text="Allow Master Login" ToolTip="Allow Master Login" AutoPostBack="True" />
            <br />
            <br />
            <br />
            Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="urtuname" CssClass="infot"  ToolTip="This Is Required Field" runat="server" ></asp:TextBox>
            &nbsp;&nbsp;
            

        </div>
    </form>
</body>
</html>
