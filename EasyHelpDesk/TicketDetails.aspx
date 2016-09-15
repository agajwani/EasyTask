<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketDetails.aspx.cs" Inherits="EasyHelpDesk.TicketDetails" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<%--<script type="text/javascript">
    //$(document).ready(function () {
    //    $("#td1").load("request.aspx #R1");
    //});
    function test() {
        $("#td1").load("request.aspx #R1");
    }
</script>--%>
<style>
    iframe{
        overflow:hidden;
        width:100%;
        height:150px;
        border:none;
    }
    body{
            background-color:#f8f8f8;
            display:block;
            width:100%;
            color:#333;
        }
    .tdbtn{
        background-color:rgb(137, 166, 185);
        font-family:Cambria;
        text-align:center;
        color:ghostwhite;
        border-color:transparent;
        cursor:pointer;
        font-weight:bold;
        font-size:20px;
        border-bottom-left-radius:10px;
        border-bottom-right-radius:10px;
        border-top-left-radius:10px;
        border-top-right-radius:10px;
        box-shadow:5px 5px black;
        padding:10px;
        margin-right:40px;
    }
    .tdbtn:hover,
    .tdbtn:active,
    .tdbtn:focus{
        background-color: rgb(225, 97, 97);
    }
    .tdbtnd{
      justify-content:center;
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
    #Footer{
            margin-top:25.5%;
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
</style>
    <script type="text/javascript">
        history.forward();
    </script>
    <%--<meta http-equiv="refresh" content="120" />--%>
</head>
<body>
    <form id="form1" runat="server">
        
    <div id="td1" onload="test()">
        <iframe src="Request.aspx" id="R1"  scrolling="no"></iframe>
    </div>
        <br />
        <br />
        <div id="tdbutton" align="center">
            <asp:Button ID="tdbrec" runat="server" CssClass="tdbtn" Text="Recent Tickets" OnClick="tdbrec_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="tdbopen" runat="server" CssClass="tdbtn" Text="Open Or Other Tickets" OnClick="tdbopen_Click" Width="241px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="tdbsearch" runat="server" CssClass="tdbtn" Text="Search Tickets" OnClick="tdbsearch_Click" />
         </div>
        <br />
        <br />
        <div id="tdsearch" runat="server" visible="false">
           <asp:Panel ID="psearch" runat="server" HorizontalAlign="Center">
             <br />
             <%--<strong>Ticket No&nbsp;&nbsp;&nbsp;&nbsp; </strong>
             &nbsp;--%><strong> Query&nbsp;&nbsp;&nbsp;&nbsp; </strong>
             &nbsp;<asp:DropDownList ID="ddlstatus" runat="server" CssClass="tdali" AutoPostBack="True" OnTextChanged="ddlstatus_SelectedIndexChanged">
                   <asp:ListItem Value="Ticketreqno">Ticket No</asp:ListItem>
                   <asp:ListItem Value="TicketGenDate">Request Date</asp:ListItem>
                   <asp:ListItem Value="Ticketreqtype">Request Type</asp:ListItem>
                   <asp:ListItem Value="Ticketrequser">Request From</asp:ListItem>
                   <asp:ListItem Value="Ticketreqlocation">Location Name</asp:ListItem>
                   <asp:ListItem Value="TicketReqDept">Department Name</asp:ListItem>
                   <asp:ListItem Value="TicketAssignTech">Assigned To Technician</asp:ListItem>
                   <asp:ListItem Value="TicketType">Ticket Type</asp:ListItem>
                   <asp:ListItem Value="TicketStatus">Request Status</asp:ListItem>
                   <asp:ListItem Value="ReqPriority">Priority</asp:ListItem>
               </asp:DropDownList>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txttckno" runat="server" CssClass="tdali"></asp:TextBox>
             
               <asp:SqlDataSource ID="trdstatus" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [Tckstatus] FROM [TicketStatusHeader] WHERE ([ActiveStatus] = @ActiveStatus)">
                   <SelectParameters>
                       <asp:Parameter DefaultValue="0" Name="ActiveStatus" Type="Int32" />
                   </SelectParameters>
               </asp:SqlDataSource>
             <%--<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Priority&nbsp;&nbsp;&nbsp;&nbsp; </strong>--%>
             &nbsp;<asp:DropDownList ID="ddlpri" runat="server" CssClass="tdali" Visible="false">
                   <asp:ListItem>Low</asp:ListItem>
                   <asp:ListItem>Medium</asp:ListItem>
                   <asp:ListItem>High</asp:ListItem>
                   <asp:ListItem>Urgent</asp:ListItem>
               </asp:DropDownList>
               <asp:DropDownList ID="ddlloc" runat="server" CssClass="tdali" Visible="False" DataSourceID="location" DataTextField="LocationName" DataValueField="LocationID">
               </asp:DropDownList>
               <asp:DropDownList ID="ddldept" runat="server" CssClass="tdali" Visible ="False" DataSourceID="department" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList>
               <asp:SqlDataSource ID="department" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [DeptId], [DeptName] FROM [Department] WHERE ([ActiveStatus] = @ActiveStatus)">
                   <SelectParameters>
                       <asp:Parameter DefaultValue="0" Name="ActiveStatus" Type="Int32" />
                   </SelectParameters>
               </asp:SqlDataSource>
               <asp:SqlDataSource ID="location" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [LocationName], [LocationID] FROM [LocationHeader] WHERE ([ActiveStatus] = @ActiveStatus)">
                   <SelectParameters>
                       <asp:Parameter DefaultValue="0" Name="ActiveStatus" Type="Int32" />
                   </SelectParameters>
               </asp:SqlDataSource>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

             <asp:Button ID="btnsearch" Text="Search" runat="server" CssClass="tdbtnali" OnClick="btnsearch_Click"  />
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="btncancel" Text="Cancel" runat="server" CssClass="tdbtnali" OnClick="btncancel_Click" />
           </asp:Panel>
        </div>
         <br />
         <br />
         <div id="td3" runat="server">
                <asp:GridView ID="tdgtckdlt" runat="server" Font-Size="20px" AllowPaging="True" BorderWidth="2px" BorderColor="Black" CellPadding="6" ForeColor="#333333" Width="100%"
                      OnPageIndexChanging="tdgtckdlt_PageIndexChanging" HorizontalAlign="Center" PageSize="15">
                    <%--<Columns>
                        <asp:TemplateField HeaderText="Assign">
                            <ItemTemplate>
                                <asp:LinkButton ID="tdgdvlbassign" runat="server" Text="Assign Ticket" PostBackUrl='<%#"~/TicketDetailView.aspx?id="+Eval("TicketNo") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>--%>
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" BorderStyle="Solid" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" Wrap="False" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE"  />
                </asp:GridView>
                </div>
          <div id="td4" runat="server" visible="false">
            <asp:GridView ID="tdgrid" runat="server" HorizontalAlign="Center" AllowPaging="true" Font-Size="20px" BorderColor="Black" BorderWidth="2px" ForeColor="#333333"  CellPadding="5" Width="100%" OnPageIndexChanging="tdgrid_PageIndexChanging" PageSize="15">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" BorderStyle="Solid" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
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
