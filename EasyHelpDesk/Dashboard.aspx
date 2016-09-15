<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EasyTask.Dashboard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <style>
        body{
            background-color:#f8f8f8;
            display:block;
            width:100%;
            color:#333;
        }
        #db2{
            font-family:Cambria;
            font-size:16px;
            float:left;
            margin-top:1%;
            width:100%;
            background-color:transparent;
            /*float:right;*/
            height:900px;
            margin-left:320px;  
            display:block;
            margin-right:2%;
            position:absolute;
        }
   
        .head_panel{
            /*background-color:#284775;*/
            width:300px;
            height:155px;
            color:ghostwhite;
            display:inline-block;
            text-align:center;
            border-bottom-left-radius:10px;
            border-bottom-right-radius:10px;
            border-top-left-radius:10px;
            border-top-right-radius:10px;
        }
        strong{
            float:left;
            /*margin-left:15px;*/
            font-family:Cambria;
            font-size:24px;
        }
        .comp{
            float:right;
            margin-right:2%;
        }
        #head {
            height: 70px;
            width: 150%;
            background: linear-gradient(#686868,#f0f0f0);
            border: 5px;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            font-family: Cambria;
            font-size: 26px;
            font-style: oblique;
            float: left;
            margin-left: 1px;
            width: 100%;
            margin-bottom: 30px;
            
        }
        .img{
            float:right;
            margin-right:5%;
            margin-top:2px;
            border-bottom-left-radius:2px;
            border-bottom-right-radius:2px;
            border-top-left-radius:2px;
            border-top-right-radius:2px;
            }
       #dbgrid{
           line-height:25px;
           font-size:15px;
       }
       #db1{
           
           background-color:#498fc0;
           width:300px;
           height:900px;
           float:left;
           display:block;
           /*overflow:hidden;*/
       }
       .lab{
            font-family:Consolas;
            font-size:76px;
            float:left;
            padding-left:196px;
       }
       .tb{
           border-bottom-left-radius:10px;
           border-bottom-right-radius:10px;
           border-top-left-radius:10px;
           border-top-right-radius:10px;
           width:15%;
           box-shadow:10px 10px Black;
           float:right;
           margin-right:6%;
           margin-top:2%;
           cursor:pointer;
       }
       .tb2{
            border-bottom-left-radius:10px;
           border-bottom-right-radius:10px;
           border-top-left-radius:10px;
           border-top-right-radius:10px;
           width:15%;
           box-shadow:10px 10px Black;
           float:right;
           margin-right:6%;
           margin-top:7%;
           cursor:pointer;
       }
       
       .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=40);
        opacity: 0.4;
    }
        .modalPopup
    {
        background-color: #2FBDF1;
        width: 300px;
        border: 3px solid #0DA9D0;
    }
    .modalPopup .header
    {
        background-color: #2FBDF1;
        height: 30px;
        color: White;
        line-height: 30px;
        text-align: center;
        font-weight: bold;
    }
    .modalPopup .body
    {
        min-height: 50px;
        line-height: 30px;
        text-align: center;
        padding:5px
    }
    .modalPopup .footer
    {
        padding: 3px;
    }
    .modalPopup .button
    {
        height: 23px;
        color: White;
        line-height: 23px;
        text-align: center;
        font-weight: bold;
        cursor: pointer;
        background-color: #9F9F9F;
        border: 1px solid #5C5C5C;
    }
    .modalPopup td
    {
        text-align:left;
    }
    </style>
    <script type="text/javascript">
        history.forward();
        function reload()
        {
            settimeout('window.location.href=window.location',1)
                //('window.location.reload()', 120);
        }
    </script>
   <%-- <script>
        $(function () {
            $("#Button1").click(function () {
                $("#db_foot").dialog({
                    title: "Show Ticket Details",
                    width: 350,
                    height: 300,
                    modal: true,
                    buttons: {
                        Close: function () {
                            $(this).dialog('close');
                        }
                    }
                });
            })
        });
    </script>--%>
   <meta http-equiv="refresh" content="120" />
    <link rel="modalpopup" type="text/css" href="modalpopup.css" />
</head>
<body onload="reload()">
    <form id="form1" runat="server" method="post">
     <div id="head">
        <a href="login.aspx" style="color:black"> <strong style="font-size:36px">Easytask Help Desk</strong> </a>
        <strong class="comp"> Medstream Technologies</strong>
         <br />
         <br />
    </div>
    <br />
    <br />
   <div id="db1" class="db1">
        <strong style="font-family:Cambria; font-size:36px; color:#f6f6f6;padding:17px;">Dashboard</strong><asp:Button ID="db" runat="server" CssClass="tb2" BackColor="WhiteSmoke" OnClick="db_Click" />
        <%--<br />
        <br />
        <br />--%>
   </div>
        
   <div id="db2">
          <br />
          <br />
      <div id="db_head" style="padding:15px;">
          <asp:Panel ID="t1" CssClass="head_panel" runat="server" HorizontalAlign="Center" BackColor="#337ab7">
              <br />
              <strong>&nbsp;Open Tickets</strong><asp:Button ID="otb" CssClass="tb" OnClick="ot_Click" runat="server" BackColor="Tomato" ToolTip="Click To View Details" />
              <br />
              <br />
              <asp:Label ID="lblopen" runat="server" CssClass="lab"></asp:Label>
          </asp:Panel>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Panel ID="t2" CssClass="head_panel" runat="server" BackColor="#5cb85c" BorderColor="#5cb85c"><asp:Button ID="tbr" runat="server" BackColor="LightPink"  CssClass="tb2" ToolTip="Click To View Details" OnClick="tbr_Click"/>
            <br />
              <strong>&nbsp; Resolved Tickets</strong>
             <br />
             <br />
             <asp:Label ID="lblresolved" runat="server" CssClass="lab"></asp:Label>
             <%--<asp:ImageButton ID="ImageButton1" ImageUrl="~/ball_button_by_fluffgar-d31mede.png" ImageAlign="Middle" CssClass="img" Text="Open" runat="server" Height="36px" Width="45px" />--%>
         </asp:Panel>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Panel ID="Panel1" CssClass="head_panel" runat="server" BackColor="#f0ad4e" BorderColor="#f0ad4e"><asp:Button ID="tbu" runat="server" BackColor="LightBlue" CssClass="tb2" ToolTip="Click To View Details" OnClick="tbu_Click" />
            <br />
               <strong>&nbsp; Unassign Tickets</strong>
              <br />
             <br />
              <asp:Label ID="lblunassign" runat="server" CssClass="lab"></asp:Label>
            <%-- <asp:ImageButton ID="ImageButton2" ImageUrl="~/glossy-black-circle-button-hi.png" ImageAlign="Middle" CssClass="img" Text="Open" runat="server" Height="36px" Width="45px" />--%>
         </asp:Panel>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Panel ID="Panel2" CssClass="head_panel" runat="server" BackColor="#d9534f" BorderColor="#d9534f"><asp:Button ID="tbo" runat="server" BackColor="GhostWhite" CssClass="tb2" ToolTip="Click To View Details" OnClick="tbo_Click" />
             <br />
              <strong>&nbsp; Other Tickets</strong>
              <br />
             <br />
             <asp:Label ID="lblpending" runat="server" CssClass="lab"></asp:Label>
            <%-- <asp:ImageButton ID="ImageButton3" ImageUrl="~/arrow.jpg" ImageAlign="Middle" CssClass="img" Text="Open" runat="server" Height="36px" Width="45px" />--%>
         </asp:Panel>
      </div>
       <br />
        <br />
       <%--<asp:PieChart ID="PieChart1" runat="server"></asp:PieChart>--%>
       <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
      <div id="db_foot">
          <asp:GridView ID="dbgrid" runat="server" Font-Names="Helvetica, Arial" Width="83%" CellPadding="4" ForeColor="#333333"  HorizontalAlign="Left" GridLines="None" PageSize="50" >
           <%-- <Columns>
                <asp:TemplateField>
            <ItemTemplate>
                <asp:Label ID="lbltckId" Text='<%# Eval("Request NO") %>' runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:ButtonField Text="Select" CommandName="Select" />
            </Columns>--%>
              <AlternatingRowStyle BackColor="White"  />
            <EditRowStyle BackColor="#2980b9" Font-Bold="true" />
            <FooterStyle BackColor="#507CD1"  ForeColor="White" />
            <HeaderStyle BackColor="#2980b9" Font-Bold="true"  ForeColor="White" />
            <PagerStyle BackColor="#2461BF" BorderStyle="Solid" ForeColor="White" HorizontalAlign="Left" />
            <RowStyle BackColor="#E9E9E9" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E9E9E9" Font-Bold="True" ForeColor="#E9E9E9" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE"  />
          </asp:GridView>
          <%--<asp:LinkButton Text="" ID = "lbtn" runat="server" />
          <cc1:modalpopupextender id ="dmpe" runat="server" PopupControlID="pnldata" TargetControlID="lbtn" CancelControlID="btnclose" BackgroundCssClass ="modalBackground">
          </cc1:modalpopupextender>
          <asp:Panel ID="pnldata" runat="server" CssClass="modalPopup" Style="display:none">
               <div class="header">
        Details
    </div>
    <div class="body">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style = "width:60px">
                    <b>Request NO: </b>
                </td>
                <td>
                    <asp:Label ID="lbltckId" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Date: </b>
                </td>
                <td>
                    <asp:Label ID="lbldate" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Type: </b>
                </td>
                <td>
                    <asp:Label ID="lbltype" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    <div class="footer" align="right">
        <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="button" />
    </div>
          </asp:Panel>--%>
          <br />
          <br />
          
      </div>
   </div>
    
    </form>
</body>
</html>
