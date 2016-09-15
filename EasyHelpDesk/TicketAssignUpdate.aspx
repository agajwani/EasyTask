<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketAssignUpdate.aspx.cs" Inherits="EasyHelpDesk.TicketDet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Assign Update</title>
    <style>
        #head{
            height:70px;
            width:100%;
            background:linear-gradient(#686868,#f0f0f0);
            border:5px;
            border-bottom-left-radius:5px;
            border-bottom-right-radius:5px;
            border-top-right-radius:5px;
            border-top-left-radius:5px;
            font-family:Cambria;
            font-size:26px;
            font-style:oblique;
            float:left;
            margin-left:1px;
            width:100%;
        }
         .comp{
            float:right;
            margin-right:2%;
        }
         #tdhead{
             font-family:Cambria;
            font-size:16px;
            float:left;
            margin-left:245px;
            width:1350px;
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
            height:1190px;
         }
         strong{
            font-family:Cambria;
            font-size:29px;
        }
         .detalign{
            border-bottom-left-radius:7px;
            border-bottom-right-radius:7px;
            border-top-left-radius:7px;
            border-top-right-radius:7px;
            font-size:30px;
            width:322px;
            /*margin-right:400px;*/
        }
         .detbtn{
            width:100px;
            border-bottom-left-radius:15px;
            border-bottom-right-radius:15px;
            border-top-left-radius:15px;
            border-top-right-radius:15px;
            box-shadow: 5px 5px black;
            margin-right:30px;
            font-size:28px;
        }
         #Footer{
            /*margin-top:40.8%;*/
            margin-top:62.3%;
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
        .session {
            float: right;
            color: black;
            font-size: 35px;
            font-family: Calibri;
            padding-right: 105px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="head">
        <strong style="font-size:36px">Easytask Help Desk</strong>
        <strong class="comp"> Medstream Technologies</strong>
        <asp:Label ID="uri" Text="Ticket Status Update" Visible="false" runat="server"></asp:Label>
        <strong class="session"><%=Session["Tuid"].ToString() %></strong>
        &nbsp;</div>
    <br />
    <br />
    <div>
        <br />
        <br />
        <br />
        <br />
    <div id="tdhead" runat="server">
        <h2 style="font-size:38px;">&nbsp; Ticket Status Details</h2>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> Requester Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>&nbsp;<asp:TextBox ID="txtreqname" runat="server" CssClass="detalign" Enabled="False"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Ticket Number</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txttcktno" runat="server" CssClass="detalign" Enabled="False"></asp:TextBox>
        <br />
        <br />
        <strong>&nbsp;&nbsp;&nbsp; Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <asp:DropDownList ID="ddlloc" runat="server" CssClass="detalign" Enabled="False"> </asp:DropDownList>
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sub Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlsubloc" runat="server" CssClass="detalign" Enabled="False"> </asp:DropDownList>
        <br />
        <br />
&nbsp;&nbsp;&nbsp; Department</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddldept" runat="server" CssClass="detalign" Enabled="False"></asp:DropDownList>
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assign to Technician</strong>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddltech" runat="server" CssClass="detalign" Width="281px" Enabled="False"></asp:DropDownList>
        <strong>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;Ticket Date</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tckdate" runat="server" CssClass="detalign" Enabled="False"></asp:TextBox>     
        &nbsp;&nbsp;&nbsp; <strong>&nbsp; Ticket Assigned on&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tckassdate" runat="server" CssClass="detalign" Width="287px" Enabled="False"></asp:TextBox>     
        </strong> 
        <br />
        <br />
        <br />
        <strong>&nbsp;&nbsp; Subject&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>&nbsp;<asp:TextBox ID="txtsub" runat="server" CssClass="detalign" Enabled="False"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        &nbsp;&nbsp;&nbsp;<br />
        <strong>&nbsp;&nbsp; Request Details </strong>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;  
        <asp:TextBox ID="txtdet" runat="server" TextMode="MultiLine" Height="102px" Width="730px" CssClass="detalign" Enabled="False"></asp:TextBox>
        <br />
        <br />
        <strong>&nbsp;&nbsp; Ticket Type</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txttype" runat="server" CssClass="detalign" Enabled="False"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <br />
        <br />
        <strong>&nbsp;&nbsp;&nbsp; Request Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>&nbsp;<asp:DropDownList ID="ddlreqtype" runat="server" CssClass="detalign" Enabled="False"></asp:DropDownList>
        <br />
        <br />
        <strong>&nbsp;&nbsp;&nbsp; Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>&nbsp;<asp:DropDownList ID="ddlstatus" runat="server" CssClass="detalign" DataSourceID="Asupd" DataTextField="Tckstatus" DataValueField="Tckstatus" AppendDataBoundItems="true">
            <asp:ListItem>Select</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="Asupd" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [Tckstatus] FROM [TicketStatusHeader] WHERE ([ActiveStatus] = @ActiveStatus)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="ActiveStatus" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Assign To Senior Tech&nbsp; <asp:DropDownList ID="ddlsentech" runat="server" CssClass="detalign" AppendDataBoundItems="True" DataSourceID="Asupduser" DataTextField="UserLoginId" DataValueField="UserLoginId">
            <asp:ListItem>Select</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="Asupduser" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [UserLoginId] FROM [UserInfo] WHERE ([ActiveStatus] = @ActiveStatus)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="ActiveStatus" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        </strong>
        <br />
        <br />
        <strong>&nbsp;&nbsp;&nbsp; Priority&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>&nbsp;<asp:DropDownList ID="ddlpri" runat="server" CssClass="detalign" Enabled="False"></asp:DropDownList>
        <br />
        <br />
        <strong>&nbsp;&nbsp;&nbsp;&nbsp; Notes  </strong>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtnotes" Height="102px" Width="730px" runat="server" CssClass="detalign" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
        <br />
        <strong>&nbsp; Notes By <%=Session["tuid"].ToString() %>  </strong>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtnotesbyuser" Height="102px" Width="730px" runat="server" CssClass="detalign" TextMode="MultiLine"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Button  ID="btnupdate" runat="server" Text="Save" CssClass="detbtn" OnClick="btnupdate_Click"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;   
        <asp:Button ID="btncancle" runat="server" Text="Cancle" CssClass="detbtn" OnClick="btncancle_Click" />
     </div>
    </div>
        <br />
        <br />
    <div id ="Footer" >
            <div id="footerleft">
                <a href="Login.aspx">Help Desk Software</a>
                "© 2016 Medstream Technologies"
            </div>
   </div>
    </form>
</body>
</html>
