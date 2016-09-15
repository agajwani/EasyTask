<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnassignTicket.aspx.cs" Inherits="EasyHelpDesk.UnassignTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unassigned Tickets</title>
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

    </style>
    <script type="text/javascript">
        history.forward();
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="ut1" onload="test()">
        <iframe src="Request.aspx" id="R1"  scrolling="no"></iframe>
    </div>
    <br />
    <br />
    <div id="ut2">
        <asp:Panel runat="server" HorizontalAlign="Center">
            <strong>Ticket No&nbsp;&nbsp;&nbsp;&nbsp; </strong>
            &nbsp;<asp:TextBox ID="txttckno" runat="server" CssClass="tdali"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnsearch" Text="Search" runat="server" CssClass="tdbtnali" OnClick="btnsearch_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btncancel" Text="Cancel" runat="server" CssClass="tdbtnali" OnClick="btncancel_Click" />
        </asp:Panel>
    </div>
    <br />
    <br />
    <div id="ut3">
        <asp:GridView ID="uatgrid" runat="server" Font-Size="20px" AllowPaging="True" BorderWidth="2px" BorderColor="Black" CellPadding="6" Width="100%" ForeColor="#333333" PageSize="15" HorizontalAlign="Center" OnPageIndexChanging="uatgrid_PageIndexChanging">
           <%-- <Columns>
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
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" Wrap="false"/>
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
