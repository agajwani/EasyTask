<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketDetailView.aspx.cs" Inherits="EasyHelpDesk.TicketDetailView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Details View</title>
    <style>
        body{
            background-color:#f8f8f8;
            display:block;
            width:100%;
            color:#333;
            
        }
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
        #msg{
            font-size:19px;
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
            color:#333;
            display:block;
            float:right;      
            margin:auto;
            padding-right:10px;
        }
        .comp{
            float:right;
            margin-right:2%;
        }
        #tckdetails{
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
            height:1220px;
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
        .detalign2{
            border-bottom-left-radius:7px;
            border-bottom-right-radius:7px;
            border-top-left-radius:7px;
            border-top-right-radius:7px;
            font-size:30px;
            width:322px;
        }
        strong{
            font-family:Cambria;
            font-size:29px;
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
            margin-top:68%;
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
        function singlecheck(chk)
        {
            var chklist = chk.parentnode.parentnode.parentnode;
            var chks = chklist.getElementsByTagname("input");
            for (var i = 0; i < chks.legth;i++)
            {
                if (chks[i] != chk && chk.checked) {
                    chks[i].checked = false;
                }
            }
        }
    </script>
    
</head>
<body>
    
    <form id="form1" runat="server">
    <div id="head">
        <strong style="font-size:36px">Easytask Help Desk</strong>
        <strong class="comp"> Medstream Technologies</strong>
        <asp:Label ID="uri" Text="Ticket Assign" Visible="false" runat="server"></asp:Label>
    </div>
   <br />
    <br />
    <div>
    <div id="tckdetails" runat="server">
        <h2 style="font-size:38px;">Ticket Details View</h2>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> Requester Name</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:TextBox ID="txtreqname" runat="server" CssClass="detalign" ReadOnly="True" disabled="disabled"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> Ticket Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:TextBox ID="txtTckno" runat="server" CssClass="detalign" ReadOnly="True" disabled="disabled"></asp:TextBox>
        </strong>
        <br />  
        <br />
          <br />
         
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> Location</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlloc" runat="server" CssClass="detalign" disabled="disabled"></asp:DropDownList>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp;&nbsp;&nbsp; Sub Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <asp:DropDownList ID="ddlsubloc" CssClass="detalign" disabled="disabled" runat="server">
        </asp:DropDownList>
        <br />
          <br />
        
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Assign To Technician</strong>&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddltech" runat="server" CssClass="detalign" DataSourceID="tckasnuname" DataTextField="UserLoginId" DataValueField="UserLoginId"></asp:DropDownList>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp; Department </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:DropDownList ID="ddldept" runat="server" CssClass="detalign2" disabled="disabled"></asp:DropDownList>
        <br />
        <br />
        <br />
          <asp:SqlDataSource ID="tckasnuname" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [UserLoginId] FROM [UserInfo] WHERE ([ActiveStatus] = @ActiveStatus)">
              <SelectParameters>
                  <asp:Parameter DefaultValue="0" Name="ActiveStatus" Type="Int32" />
              </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Ticket Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtTckdate" runat="server" CssClass="detalign" ReadOnly="True" disabled="disabled"></asp:TextBox>
        </strong>
          <br />
        <br />
          <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> Subject</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtsub" runat="server" CssClass="detalign" ReadOnly="True" disabled="disabled"></asp:TextBox>
          <br />
        <br />
          <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong>Request Details</strong>
            <br />
          <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
            <asp:TextBox td="txtreqdet" runat="server" CssClass="detalign" TextMode="MultiLine" Height="102px" Width="730px" ID="TxtreqDtl" ReadOnly="True" disabled="disabled"></asp:TextBox>        
          <br />
          <br />
          <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong>Ticket Type</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:CheckBox ID="cbser" runat="server" CssClass="detalign" Text="Service Request" ValidationGroup="g1" AutoPostBack="true" OnCheckedChanged="cbser_CheckedChanged" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="cbinc" runat="server" CssClass="detalign" Text="Incident" OnCheckedChanged="cbinc_CheckedChanged" ValidationGroup="g1" AutoPostBack="True" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="cbprb" runat="server" CssClass="detalign" Text="Problem" OnCheckedChanged="cbprb_CheckedChanged" ValidationGroup="g1" AutoPostBack="True" />
          <br />
        <br />
          <br />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong> Request Type</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddltype" runat="server" CssClass="detalign" Width="322px" disabled="disabled" ></asp:DropDownList>
          <br />
        <br />
          <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> Status</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:DropDownList ID="ddlstatus" runat="server" CssClass="detalign" DataSourceID="tckstat" DataTextField="Tckstatus" DataValueField="Tckstatus"></asp:DropDownList>
          <asp:SqlDataSource ID="tckstat" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [Tckstatus] FROM [TicketStatusHeader] WHERE ([ActiveStatus] = @ActiveStatus)">
              <SelectParameters>
                  <asp:Parameter DefaultValue="0" Name="ActiveStatus" Type="Int32" />
              </SelectParameters>
        </asp:SqlDataSource>
          <br />
        <br />
          <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> Priority</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
            <asp:DropDownList ID="ddlpri" runat="server" CssClass="detalign">
                <asp:ListItem Value="Low">Low</asp:ListItem>
                <asp:ListItem>Medium</asp:ListItem>
                <asp:ListItem>High</asp:ListItem>
                <asp:ListItem>Urgent</asp:ListItem>
        </asp:DropDownList>
          <br />
        <br />
          <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <strong>Notes</strong>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
            <asp:TextBox td="txtnotes" runat="server" CssClass="detalign" TextMode="MultiLine" Height="102px" Width="730px" ID="txtnotes"></asp:TextBox>        
         <br />
        <br />
          <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="detbtn" OnClick="btnsave_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btncancle" runat="server" Text="Cancel" CssClass="detbtn" OnClick="btncancle_Click" />
       <br />
        <br />
        <br />

    </div>
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
