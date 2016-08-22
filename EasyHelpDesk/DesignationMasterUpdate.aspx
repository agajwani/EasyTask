<%@ Page Language="C#" AutoEventWireup="true" Inherits="DesignationMasterUpdate" Codebehind="DesignationMasterUpdate.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Designation Master</title>
    <style>
        body{
            background:rgb(12, 97, 33);
           background-repeat: no-repeat;
    background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
            height:100%;
            

        }
        #back{
           
            padding:15px;
            text-align:center;
            height: 0px;
            color:#2c3e50;
             font-family:'Franklin Gothic';
            font-size:45px;
        }
        .info{
            margin-left:auto;
            margin-right:auto;
            font-size:25px;
            width:700px;
            height:320px;
            font-family:'Franklin Gothic';
            background-color:#2c3e50;
            box-shadow:10px 10px black;
            color:ghostwhite;
        }
        
        .Button{
            font-family:'Franklin Gothic';
            font-size:20px;
            margin-left:150px;
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
        .Button:hover,
        .Button:active,
        .Button:focus{
            color:rgb(12, 97, 33);
        }
        .infot{
            font-family:'Franklin Gothic';
            font-size:25px;
        }
        .infoc{
            font-family:'Franklin Gothic';
            font-size:25px;
            margin-left:250px;
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
    <div id="back" class="back">
    <asp:Label ID="lbldesgi" Text="Designation Master Update" runat="server" Font-Bold="true"></asp:Label>
        <strong class="session"><%=Session["UId"].ToString() %></strong>
    </div>
    <form id="form1" runat="server">
    <div>
    <br />
            <asp:Label ID="uri" runat="server" Text="DesignationMasterUpdate" Visible="false"></asp:Label>
       <br />
        <br />
        <br />
        <div id="info" class="info">
            
            <br />
            <asp:SqlDataSource ID="desiganation" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [DesignationName] FROM [Designation]"></asp:SqlDataSource>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Designation &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DDLdesignation" DataSourceID="desiganation" DataTextField="DesignationName" DataValueField="DesignationName" CssClass="infot" ToolTip="Select designation" Width="259px" Height="30px" Font-Size="25px" runat="server" TabIndex="1" AutoPostBack="True" OnTextChanged="DDLdesignation_TextChanged"></asp:DropDownList>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Modified Designation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtmodify" runat="server" ToolTip="Enter New Designation"  Width="259px" Height="30px" Font-Size="25px" TabIndex="2"></asp:TextBox>
            <br />


            <br />
            <asp:CheckBox ID="cbactive" runat="server" CssClass="infoc" Text="Inactive Designation" ToolTip="Inactive Designatiion" TabIndex="3" />
            <br />
            <br />
           <asp:Button ID="btnupdate" CssClass="Button"  runat="server" Text="Update" TabIndex="4" OnClick="btnupdate_Click"/>
            <asp:Button ID="btncancel" CssClass="Button" runat="server" Text="Cancel" TabIndex="5" OnClick="btncancel_Click"/>
            <br />
            <br />
            
        </div>
    </div>
    </form>
</body>
</html>
