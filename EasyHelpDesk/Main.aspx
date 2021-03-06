﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="EasyHelpDesk.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        EasyTask Help Desk
    </title>
    <style>
        body{
            background:#f8f8f8;
            /*font-size:16px;*/
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
            color:#333;
            display:block;
            width:100%;
        }
         font{
             /*font-weight:100;*/
         font-family:Cambria;
         font-size:22px;
    }
        .smsg{
            box-sizing:border-box;
            float:left;
            font-size:16px;
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
            color:#333;
            display:block;
            border-color:#e7e7e7;
            border:1px;
}
        
        .smsg2{
            font-size:19px;
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
            color:#333;
            display:block;
            float:right;
            
            margin:auto;
            padding-right:10px;
            
        }
        .pannels{
            /*display:block;
            border-color:#e7e7e7;
            border:1px;
            background-color:#007acc;*/
        }
        .li{
            display:list-item;
            text-align:match-parent;
        }
        .a{
            cursor:auto;
        }
        .btn{
            background-color:#5b9cc7;
            font-family:Cambria;
            font-size:20px;
            color:ghostwhite;
            border:5px;
            border-bottom-left-radius:10px;
            border-bottom-right-radius:10px;
            border-top-right-radius:10px;
            border-top-left-radius:10px;
            padding-left:16px;
            /*margin-top:2px;*/
            margin-left:36px;
            box-shadow:5px 5px black;
        }
        #btbox{
            height:76px;
            width:100%;
            background:linear-gradient(#686868,#f0f0f0);
            border:5px;
            border-bottom-left-radius:5px;
            border-bottom-right-radius:5px;
            border-top-right-radius:5px;
            border-top-left-radius:5px;
            font-family:Calibri;
            font-size:38px;
            font-style:oblique;
            
        }
        #Reqdetails{
            font-family:Cambria;
            font-size:16px;
            float:left;
            margin-left:20px;
            width:95%;
            background-color:transparent;
            border-bottom-left-radius:4px;
            border-bottom-right-radius:4px;
            border-top-left-radius:4px;
            border-top-right-radius:4px;
            border-left:2px solid #ccc;
            border-bottom:2px solid #ccc;
            border-top:2px solid #ccc;
            border-right:2px solid #ccc;
            background:linear-gradient(rgb(134, 178, 226) rgb(165, 136, 136));
            display:block;
            box-shadow:5px 5px black;
            height:700px;
        }
        .reqalign{
            /*margin-left:60px;*/
            border-bottom-left-radius:7px;
            border-bottom-right-radius:7px;
            border-top-left-radius:7px;
            border-top-right-radius:7px;
        }
        .reqalignt {
            margin-left:246px;
            border-bottom-left-radius:7px;
            border-bottom-right-radius:7px;
            border-top-left-radius:7px;
            border-top-right-radius:7px;
        }
        .reqbtns{
            float:right;
            border-bottom-left-radius:15px;
            border-bottom-right-radius:15px;
            border-top-left-radius:15px;
            border-top-right-radius:15px;
            margin-right:16px;
            box-shadow:5px 5px black;
            width:89px;
        }
        .reqbtns:hover{
            width:150px;
            height:50px;
            background-color:#5b9cc7;
            color:ghostwhite;
        }
        .reqbtns:active,
        .reqbtns:focus{
            color:rgb(12, 97, 33);
        }
        .reqbtn
        {
            float:right;
            border-bottom-left-radius:15px;
            border-bottom-right-radius:15px;
            border-top-left-radius:15px;
            border-top-right-radius:15px;
            margin-right:16px;
            box-shadow:5px 5px black;
            width:89px;
        }
        #Footer{
            margin-top:55%;
            color:antiquewhite;
            height:46px;
            width:100%;
            vertical-align:bottom;
            background-repeat:repeat-x;
            background:#999;
            /*position:fixed;*/
        }
        #footerleft{
            padding-left:20px;
            padding-top:10px;
            float:left; 
        }
        .session{
    float:right;
    color:black;
    font-size:35px;
    font-family:Calibri;
    padding-right:105px;
}
         #tickethist{
            font-family:Cambria;
            font-size:16px;
            float:left;
            /*margin-left:245px;*/
            width:100%;
            background-color:transparent;
            border-bottom-left-radius:4px;
            border-bottom-right-radius:4px;
            border-top-left-radius:4px;
            border-top-right-radius:4px;
            border-left:2px solid #ccc;
            border-bottom:2px solid #ccc;
            border-top:2px solid #ccc;
            border-right:2px solid #ccc;
            background:linear-gradient(rgb(134,178,226) rgb(165,136,136));
            display:block;
            box-shadow:5px 5px black;
            /*height:823px;*/
        }
         .grid{
            /*margin-left:20px;*/
        }
       
        .reqbtnhis
        {
            float:right;
            border-bottom-left-radius:15px;
            border-bottom-right-radius:15px;
            border-top-left-radius:15px;
            border-top-right-radius:15px;
            margin-right:30px;
            box-shadow:5px 5px black;
            width:89px;
        }
        .Cimg{
            float:right;
            margin-right:5%;
            margin-top:2px;
            border-bottom-left-radius:2px;
            border-bottom-right-radius:2px;
            border-top-left-radius:2px;
            border-top-right-radius:2px;
            height:85%;
            
        }
    </style>
    <%--<link href="themes/sb-admin-2.less" rel="stylesheet" />--%>
    <!-- Bootstrap Core CSS -->
    <link href="themes/Bootstrap/bootstrap.min.css" rel="stylesheet"/>

    <!-- MetisMenu CSS -->
    <link href="themes/Bootstrap/metisMenu.min.css" rel="stylesheet"/>

    <!-- Timeline CSS -->
    <link href="themes/timeline.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="themes/sb-admin-2.css" rel="stylesheet"/>

    <!-- Morris Charts CSS -->
    <link href="themes/Bootstrap/morris.css" rel="stylesheet"/>

    <!-- Custom Fonts -->
    <link href="themes/Bootstrap/font-awesome.min.css" rel="stylesheet" type="text/css"/>
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
                 
        <%--<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Welcome To Easytask Help Desk</a>&nbsp;
            </div>
             <div id="msg2" class="smsg2">
                Medstream Technologies
                 
                 
            </div>
            </nav>--%>
        <br />
        
        <div id="btbox">
            <div id="msg2" class="smsg2">
                Medstream Technologies
            </div>
            <strong>&nbsp;EasyTask Help Desk </strong><asp:Button ID="mbreq" CssClass="btn" runat="server" Text="Submit New Request" Font-Size="18px" ToolTip="Click Here For New reauest"  OnClick="mbreq_Click"/>
        <asp:Button ID="mbhis" CssClass="btn" runat="server" Text="History" Font-Size="18px" ToolTip="Click Here To View Ticket History" OnClick="mbhis_Click" />
            <%--<asp:Button ID="Logout" CssClass="btn" runat="server" Text="Logout" Font-Size="18px" ToolTip="Click Here To Logout" OnClick="Logout_Click" />--%>
            <asp:ImageButton ID="imgbtn" Text="Switch" ImageUrl="~/images/Aqua-Switch-User-icon.png" CssClass="Cimg" runat="server" OnClick="imgbtn_Click" ToolTip="Switch To View Assigned Ticket." OnLoad="imgbtn_Load" />
                    <asp:ImageButton ID="tadblogout" CssClass="Cimg" ToolTip="Click To Logout" ImageUrl="~/images/Logout-icon.png" runat="server"  OnClick="tadblogout_Click"/>
        
            <asp:ImageButton ID="imgbtnmaster" Text="Switch To Master" ImageUrl="~/images/1473172417_gear.png" Visible="false" CssClass="Cimg" runat="server" OnClick="imgbtnmaster_Click" OnLoad="imgbtnmaster_Load" ToolTip="Switch To View Assigned Ticket." />
            <strong class="session"><%=Session["tuid"].ToString() %></strong>
        </div>
        <br />
        <br />
        <div id ="Reqdetails" runat="server" visible="false">
            <h2 style="font-weight:bold">Ticket Request. </h2>
            <br />
              <font>&nbsp;&nbsp;&nbsp;&nbsp; Servicing Department:&nbsp;<asp:DropDownList ID="ddldept" runat="server"  CssClass="reqalign" Width="246px" ToolTip="Required Field" DataSourceID="Mdept" DataTextField="DeptName" DataValueField="DeptId">
                 <asp:ListItem Value="0">Select</asp:ListItem>
                 </asp:DropDownList><sup>&nbsp;*</sup>
                 <asp:SqlDataSource ID="Mdept" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [DeptId], [DeptName] FROM [Department] WHERE ([ActiveStatus] = @ActiveStatus)">
                     <SelectParameters>
                         <asp:Parameter DefaultValue="0" Name="ActiveStatus" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
            </font>
            <br />
            <br />
<%--            <br />--%>
            <%--<h4>--%> <font>&nbsp;&nbsp;&nbsp;&nbsp; Ticket Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DDlTicketType" CssClass="reqalign" runat="server"  Width="246px" DataSourceID="maintcktyp" DataTextField="Tcktyp" DataValueField="Tcktyp" ToolTip="Required Field">
                <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList> <sup>&nbsp;*</sup>
                <asp:SqlDataSource ID="maintcktyp" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [Tcktyp] FROM [TicketTypeHeader] WHERE ([ActiveStatus] = @ActiveStatus)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="ActiveStatus" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
          <%--  </h4>--%></font>
            <br />
            <br />
             <font> &nbsp;&nbsp;&nbsp;&nbsp; Subject:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <asp:TextBox ID="tsub"  CssClass="reqalign" runat="server" Width="443px" ToolTip="Required Field"></asp:TextBox> 
                 <sup>*</sup></font><br />
            <br />
             <font>&nbsp;&nbsp;&nbsp;&nbsp; Request Details:&nbsp;
            <sup>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *</sup>
                 <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="TReq" runat="server"   CssClass="reqalign" TextMode="MultiLine" Height="102px" Width="448px" ToolTip="Required Field"></asp:TextBox></font><br />
            <br />
            <font>&nbsp;&nbsp;&nbsp;&nbsp; Location:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <asp:DropDownList ID="ddllocation" runat="server" AppendDataBoundItems="true" CssClass="reqalign" Width="246px"  DataSourceID="mlocation" DataTextField="LocationName" DataValueField="LocationID" ToolTip="Required Field" AutoPostBack="True" appenddata OnSelectedIndexChanged="ddllocation_TextChanged">
                <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList><sup>&nbsp;*</sup>
                <asp:SqlDataSource ID="mlocation" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [LocationName], [LocationID] FROM [LocationHeader] WHERE ([ActiveStatus] = @ActiveStatus)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="ActiveStatus" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;&nbsp;&nbsp; Sub Location:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddlsubloc" CssClass="reqalign" Width="246px" runat="server">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList><sup>&nbsp;*</sup>
            </font>
            <br />
            <br />
    
            <font>&nbsp;&nbsp;&nbsp;&nbsp; Conact Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="rtextno" runat="server" CssClass="reqalign" Width="80px" MaxLength="4"></asp:TextBox>
                &nbsp;&nbsp;&nbsp; &nbsp; <asp:TextBox ID="rtcno" runat="server" CssClass="reqalign" Width="246px" onkeypress="NumberOnly()" MaxLength="12" ToolTip="Required Field"></asp:TextBox><sup>&nbsp;*</sup>
            </font>
            <br />
            <br />
            <font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Attachments: &nbsp;<asp:FileUpload ID="Rfupload"  CssClass="reqalignt"  runat="server" Width="341px" /></font>
            <br />
            <%--<div id="reqbtn">--%>
                <font><asp:Button ID="rbsubmit" runat="server" CssClass="reqbtns" Text="Submit" OnClick="rbsubmit_Click" />
                <asp:Button ID="rbcancel" runat="server" CssClass="reqbtn" Text="Cancel" OnClick="rbcancel_Click" />
                <asp:Button ID="rsclr" runat="server" CssClass="reqbtn" Text="Clear" OnClick="rsclr_Click" /></font>
           <%-- </div>--%>
        </div>
         <div id="tickethist" runat="server" visible="false">
            <h2><strong>&nbsp;Ticket History.</strong> </h2>
             <br />
             <br />
             <h4><%--&nbsp;Ticket No.&nbsp;&nbsp;
                <asp:TextBox ID="txtticketno" runat="server" CssClass="reqalign" Width="116px"></asp:TextBox>
                 &nbsp;&nbsp;&nbsp;&nbsp;--%>
                 Ticket Search Criteria &nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlstatus" runat="server" CssClass="reqalign" Width="264px">
                     <asp:ListItem Value="TicketNumber">Ticket No</asp:ListItem>
                     <asp:ListItem Value="Ticketdate">Date</asp:ListItem>
                     <asp:ListItem Value="TicketType">Type</asp:ListItem>
                     <asp:ListItem Value="tckstatus">Status</asp:ListItem>
                 </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:TextBox ID="txtticketno" runat="server" CssClass="reqalign" Width="196px"></asp:TextBox>
                 <asp:SqlDataSource ID="Ticstats" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [Tckstatus] FROM [TicketStatusHeader]"></asp:SqlDataSource>
                 &nbsp;&nbsp;<%--&nbsp;&nbsp;Contains&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtcontains" runat="server" CssClass="reqalign" Width="116px"></asp:TextBox>--%>
                
                 <asp:Button ID="rbsearch" runat="server" CssClass="reqbtnhis" Text="Search" OnClick="rbsearch_Click" />
                  <asp:Button ID="rbclear" runat="server" CssClass="reqbtnhis" Text="Clear" OnClick="rbclear_Click" />
             </h4>
             <br />
             <br />
             <%--<h4>--%>
                 &nbsp;&nbsp;
                 <asp:GridView ID="ticketgdv" runat="server" Font-Size="20px" AllowPaging="True" BorderWidth="2px" BorderColor="Black" CellPadding="6" ForeColor="#333333" Width="100%"
                      OnPageIndexChanging="ticketgdv_PageIndexChanging" HorizontalAlign="Left" PageSize="15">
                      <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" Wrap="True" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE"  />
                 </asp:GridView>
                 <br />
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [TicketID], [TicketNumber], [Ticketdate], [TicketType], [TicketSubject], [TicketReqInfo], [tckstatus] FROM [ticketdetails]"></asp:SqlDataSource>
                 <asp:Button ID="Tichistcan" runat="server" CssClass="reqbtn" Text="Cancel" OnClick="Tichistcan_Click"  />
                 <br />
                 <%--<h4>
                 &nbsp;&nbsp;Ticket Per Page
                
                &nbsp;&nbsp;<asp:DropDownList ID="ddlpage" CssClass="reqalign" runat="server" style="margin-left: 0px" Width="116px" AutoPostBack="true">
                         <asp:ListItem>10</asp:ListItem>
                         <asp:ListItem>25</asp:ListItem>
                         <asp:ListItem>50</asp:ListItem>
                         <asp:ListItem>100</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                     </asp:DropDownList>
                </h4>--%>
             <%--</h4>--%>
             
        </div>
        <div id ="Footer" >
            <div id="footerleft">
                <a href="#">Help Desk Software</a>
                "© 2016 Medstream Technologies"
            </div>
        </div>
       
            </form>
</body>
</html>
