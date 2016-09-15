<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="EasyHelpDesk.Company" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Company Master</title>
    <style>
        body{
            height: 100%;
            background-color:#f8f8f8;
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
            width: 1250px;
            height:800px;
            margin: 40px auto ;
            border-radius: 4px;
            box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
            font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
           font-size:25px;
            color:#ffffff;
            align-items:center;
       }
         .button{
           font-family:'Franklin Gothic';
            font-size:20px;
            margin-left:100px;
            border-bottom-left-radius:10px;
            border-bottom-right-radius:10px;
            border-top-left-radius:10px;
            border-top-right-radius:10px;
            box-shadow: 10px 10px black;
            cursor:pointer;
            width:123px;
             background-color:rgb(104, 145, 162);
           font-weight:bold;
           color:white;
        }
        .button:hover,
        .button:active,
        .button:focus{
            color:rgb(12, 97, 33);
        }
        .txt{
            border-bottom-left-radius:5px;
            border-bottom-right-radius:5px;
            border-top-left-radius:5px;
            border-top-right-radius:5px;
        }
        .session{
    float:right;
    color:black;
    font-size:35px;
    font-family:Calibri;
    padding-right:105px;
    </style>
    <script type="text/javascript">
        function Numberonly() {
            //var Asciivalue = event.keycode
            //if ((Asciivalue >= 48 && Asciivalue <= 57) || (Asciivalue == 8 || Asciivalue == 127))
            //    event.returnValue = true;
            //else
            //    event.returnValue = false;
            var AsciiValue = event.keyCode
            if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
                event.returnValue = true;
            else
                event.returnValue = false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="head" class="head">
        <asp:Label ID="lblcomp" Text="Company Master" runat="server" Font-Bold="true"></asp:Label>
        <strong class="session"><%=Session["tuid"].ToString() %></strong>
        <br />
        <br />
        <br />
    </div>
    <div id="info" class="info">
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp; Company Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtcopname" runat="server" CssClass="txt"  Width="399px" Height="30px" Font-Size="25px" ></asp:TextBox>
       <%--<asp:RegularExpressionValidator ID="Cnameval" runat="server" ErrorMessage="Comapny Name Can't Be Blank" ControlToValidate="txtcopname" ValidationExpression="^[a-zA-Z\s]{1,40}$"></asp:RegularExpressionValidator>--%>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
         &nbsp;&nbsp;&nbsp; Company Address &nbsp;
    
          <br />        
       <%-- <asp:TextBox ID="txtadd" runat="server" Width="399px" Height="30px" Font-Size="25px"></asp:TextBox> --%>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;
        <asp:TextBox ID="txtadd1" runat="server" CssClass="txt" TextMode="MultiLine" Width="399px" Height="90px" Font-Size="25px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <br />
        
        <br />
         &nbsp;&nbsp;&nbsp;
         Company Prefix&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="txtcomppre" runat="server" CssClass="txt"  Width="259px" Height="30px" MaxLength="4" Font-Size="25px"></asp:TextBox>
        <%--<asp:RegularExpressionValidator ID="cpval" runat="server" ErrorMessage="Company Prefix Can't Be Blank And Not More Than 4 Charactres" ControlToValidate="txtcomppre" ValidationExpression="^[a-zA-Z0-9\s]{4}$"></asp:RegularExpressionValidator>--%>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        City&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtcity" runat="server" CssClass="txt"  Width="259px" Height="30px" Font-Size="25px" ></asp:TextBox>
         <%--<asp:RegularExpressionValidator ID="cityval" runat="server" ErrorMessage="City Can't Be Blank" ControlToValidate="txtcity" ValidationExpression="^[a-zA-Z\s]{1,40}$"></asp:RegularExpressionValidator>--%>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtstate" runat="server" Width="259px" CssClass="txt" Height="30px" Font-Size="25px"></asp:TextBox>
        <%--<asp:RegularExpressionValidator ID="stateval" runat="server" ErrorMessage="State Can't Be Blank" ControlToValidate="txtstate" ValidationExpression="^[a-zA-Z\s]{1,40}$"></asp:RegularExpressionValidator>--%>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        Country&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtcountry" runat="server" CssClass="txt" Width="259px" Height="30px" Font-Size="25px"></asp:TextBox>
        <%--<asp:RegularExpressionValidator runat="server" ErrorMessage="Country Can't Be Blank" SetFocusOnError="true" ControlToValidate="txtcountry" ValidationExpression="^[a-zA-Z\s]{1,40}$"></asp:RegularExpressionValidator>--%>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pincode No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtpin" runat="server" Width="259px" CssClass="txt" Height="30px" Font-Size="25px" onkeypress="Numberonly()"></asp:TextBox>
        <%--<asp:RegularExpressionValidator ID="pinval" runat="server" ErrorMessage="Pincode Can't Be Blank" SetFocusOnError="true" ControlToValidate="txtpin" ValidationExpression="^[0-9\s]{1,15}$"></asp:RegularExpressionValidator>--%>
        <br />
        <br />
        &nbsp;&nbsp;
        Telephone No. 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:TextBox ID="txttel1" runat="server" Width="259px" CssClass="txt" Height="30px" Font-Size="25px" MaxLength="12" onkeypress="Numberonly()"></asp:TextBox>
        <%--<asp:RegularExpressionValidator ID="telval" runat="server" ErrorMessage="Any 1 Contact Number Is Necessary" SetFocusOnError="true" ControlToValidate="txttel1" ValidationExpression="^[0-9\s]{1,12}$"></asp:RegularExpressionValidator>--%>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Telephone No.2&nbsp;&nbsp;
        <asp:TextBox ID="txtte2" runat="server" Width="259px" Height="30px" CssClass="txt" Font-Size="25px" MaxLength="12" onkeypress="Numberonly()"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;
        Contact Person&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtperson" runat="server" Width="259px" Height="30px" CssClass="txt" Font-Size="25px"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;
        Email id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="email" runat="server" Width="259px" Height="30px" CssClass="txt" Font-Size="25px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Website&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="website" runat="server" Width="259px" Height="30px" CssClass="txt" Font-Size="25px"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnadd" runat="server" Text="Add" CssClass="button" ToolTip="Click here to Add" OnClick="btnadd_Click"  />
        <%--<asp:Button ID="btnedit" runat="server" Text="Edit" CssClass="button" ToolTip="Edit"  />--%>
        <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="button" ToolTip="Click here to Cancel" OnClick="btncancel_Click" />
        <br />
    </div>
    </form>
</body>
</html>
