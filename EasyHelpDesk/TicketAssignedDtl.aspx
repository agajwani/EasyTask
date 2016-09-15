<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketAssignedDtl.aspx.cs" Inherits="EasyHelpDesk.TicketAssignedDtl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assigned Ticket Details</title>
    <meta http-equiv="refresh" content="120" />
    <style>
        body{
            background-color:#f8f8f8;
            display:block;
            width:100%;
            color:#333;
        }
        #head {
            height: 76px;
            width: 100%;
            background: linear-gradient(#686868,#f0f0f0);
            border: 5px;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            font-family: Calibri;
            font-size: 38px;
            font-style: oblique;
            float: left;
            margin-left: 1px;
            width: 100%;
            margin-bottom: 30px;
            
        }
        .comp{
            float:right;
            margin-right:2%;
        }
       .tdbtnali{
        width:150px;
        border-bottom-left-radius:15px;
        border-bottom-right-radius:15px;
        border-top-left-radius:15px;
        border-top-right-radius:15px;
        height:30px;
        font-size:22px;
        font-family:Cambria;
       
       
    }
        strong{
         font-family:Cambria;
         font-size:20px;
    }
        .tdali{
        border-bottom-left-radius:7px;
            border-bottom-right-radius:7px;
            border-top-left-radius:7px;
            border-top-right-radius:7px;
            font-size:30px;
            width:300px;
    }
         .session{
    float:right;
    color:black;
    font-size:35px;
    font-family:Calibri;
    padding-right:105px;
}
         #Footer{
            margin-top:40.8%;
            color:antiquewhite;
            height:46px;
            width:100%;
            vertical-align:bottom;
            background-repeat:repeat-x;
            background:#999;
        }
        #footerleft{
            padding-left:20px;
            padding-top:10px;
            float:left; 
        }
        .imgb{
            float:right;
            height:80%;
            margin-right:2%;
            margin-top:0.3%;
        }
        .Cimg{
             float:right;
            height:85%;
            margin-right:1%;
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
    <div id="head">
        <strong style="font-size:36px">Easytask Help Desk</strong>
        <strong class="comp"> Medstream Technologies</strong>
         <asp:ImageButton ID="imgbtn" Text="Switch" ImageUrl="~/images/Aqua-Switch-User-icon.png" CssClass="Cimg" runat="server" OnClick="imgbtn_Click" ToolTip="Switch To Create New Ticket." OnLoad="imgbtn_Load" />
        <asp:ImageButton ID="tadblogout" CssClass="imgb" ToolTip="Click To Logout" ImageUrl="~/images/Logout-icon.png" runat="server"  OnClick="tadblogout_Click"/>
         <asp:ImageButton ID="imgbtnmaster" Text="Switch To Master" ImageUrl="~/images/1473172417_gear.png" Visible="false" CssClass="Cimg" runat="server" OnClick="imgbtnmaster_Click"  OnLoad="imgbtnmaster_Load"  ToolTip="Switch To View Assigned Ticket." />
        <strong class="session">Department Id= <asp:Label ID="udept" Text="" runat="server"></asp:Label></strong>
        <strong class="session"><%=Session["tuid"].ToString() %></strong>
        
         <br />
         <br />
        <br />
        <br />
    </div>
    <br />
    <br />
    <br />
    <br />
    <div id="tckt1">
        <br />
        <br />
        <asp:Panel runat="server" HorizontalAlign="Center">
            <%--<strong>Ticket No&nbsp;&nbsp;&nbsp;&nbsp; </strong>--%>
            &nbsp;<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Status&nbsp;&nbsp;&nbsp;&nbsp; </strong>
            &nbsp;<asp:DropDownList ID="ddlstatus" runat="server" CssClass="tdali" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlstatus_SelectedIndexChanged" AutoPostBack="True" ViewStateMode="Enabled">
                <asp:ListItem Value="Ticketreqno">Request No</asp:ListItem>
                <asp:ListItem Value="Request Date"></asp:ListItem>
                <asp:ListItem Value="Ticketreqtype">Request Type</asp:ListItem>
                <asp:ListItem Value="Ticketrequser">Request From</asp:ListItem>
                <asp:ListItem Value="Ticketreqlocation">Location</asp:ListItem>
                <asp:ListItem Value="TicketReqDept">Department</asp:ListItem>
                <asp:ListItem Value="TicketAssignTech">Assigned To</asp:ListItem>
                <asp:ListItem Value="TicketType">Type</asp:ListItem>
                <asp:ListItem Value="TicketStatus">Status</asp:ListItem>
                <asp:ListItem Value="ReqPriority">Priority</asp:ListItem>
            </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txttckno" runat="server" CssClass="tdali"></asp:TextBox>
            
            <asp:SqlDataSource ID="Tickstat" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [Tckstatus], [Tckstatid] FROM [TicketStatusHeader] WHERE ([ActiveStatus] = @ActiveStatus)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="ActiveStatus" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <%--<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Priority&nbsp;&nbsp;&nbsp;&nbsp; </strong>--%>
            &nbsp;<asp:DropDownList ID="ddlpri" runat="server" CssClass="tdali" Visible="false">
                <asp:ListItem>Low</asp:ListItem>
                <asp:ListItem>Medium</asp:ListItem>
                <asp:ListItem>High</asp:ListItem>
                <asp:ListItem>Urgent</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlloc" CssClass="tdali" runat="server" Visible="False" DataSourceID="location" DataTextField="LocationName" DataValueField="LocationID">
            </asp:DropDownList>
            <asp:DropDownList ID="ddldept" CssClass ="tdali" runat="server" Visible="False" DataSourceID="Department" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList>
            <asp:SqlDataSource ID="Department" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [DeptId], [DeptName] FROM [Department] WHERE ([ActiveStatus] = @ActiveStatus)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="ActiveStatus" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="location" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [LocationID], [LocationName] FROM [LocationHeader] WHERE ([ActiveStatus] = @ActiveStatus)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="ActiveStatus" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnsearch" Text="Search" runat="server" CssClass="tdbtnali" OnClick="btnsearch_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btncancel" Text="Cancel" runat="server" CssClass="tdbtnali" OnClick="btncancel_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnmytck" Text="My Tickets" runat="server" CssClass="tdbtnali" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btndepttck" Text="My Department Tickets" runat="server" Width="236px" CssClass="tdbtnali" />
        </asp:Panel>
        <br />
        <br />
        <asp:GridView ID="gdtckt" runat="server" Font-Size="20px" AllowPaging="True" BorderWidth="2px" BorderColor="Black" CellPadding="6" ForeColor="#333333" Width="100%" 
            overflow="scroll" PageSize="15" HorizontalAlign="Center" OnPageIndexChanging="gdtckt_PageIndexChanging" AutoGenerateEditButton="false" DataKeyNames="Request No">
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Wrap="false" />
            <PagerStyle BackColor="#284775" BorderStyle="Solid" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" Wrap="true" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE"  />
        </asp:GridView>
    </div>
        
        <div id ="Footer" >
            <div id="footerleft">
                <a href="Login.aspx">Help Desk Software</a>
                "© 2016 Medstream Technologies"
            </div>
            </div>
    </form>
</body>
</html>
