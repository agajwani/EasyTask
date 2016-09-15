

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="EasyHelpDesk.ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot EasyTask Password</title>
    <style>
        body{
            font-family: Sans-serif;
            color:ghostwhite;
            font-size:20px;
            margin:100px;
            padding:20px;
            height:100%;
  /*background: rgb(12, 97, 33);
   background-repeat:no-repeat;
    background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
  background:#f8f8f8;
  text-align:center
        }
        .info{
            margin-left:720px;
            width:350px;
            background: #2c3e50;
             /*rgb(30, 163, 98);*/
            /*color:#2c3e50;*/
            height:320px;
            outline:double;
            box-shadow:10px 10px black;
         }
        .uinfo{
            font-family:sans-serif;
            font-size:18px;
            width:287px;
        }
        .text
        {
            visibility:hidden;
        }
        .button{
            font-family:'Lucida Sans Unicode';
            font-size:20px;
            border-bottom-left-radius:10px;
            border-bottom-right-radius:10px;
            border-top-left-radius:10px;
            border-top-right-radius:10px;
            box-shadow:10px 10px black;
            width:105px;
            cursor:pointer;
        }
        .Back
        {
            color:ghostwhite;
        }
        .Back:hover
        {
            color:black;
            
        }
    </style>
    <script type="text/javascript">
        history.forward();
</script>
</head>
<body>
    <strong>Forgot Password.
    <br />
    </strong>
    <br />
    <br />
    <form id="form1" runat="server">
    <div id="info" class="info">
    <asp:SqlDataSource ID="fguname" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT [UserLoginId] FROM [UserInfo]"></asp:SqlDataSource>
        <br />
        <br />
        
        <strong> Username| <a class="Back" href="Masters.aspx"><span>Back</span></a></strong>
        <br />
        <br />
<asp:dropdownlist runat="server" ID="Fgduname" DataSourceID="fguname" DataTextField="UserLoginId" DataValueField="UserLoginId" CssClass="uinfo"></asp:dropdownlist>
&nbsp;<asp:TextBox ID="fgtpass" runat="server" CssClass="text"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="fgtpass2" runat="server" CssClass="uinfo" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="fgbshow" CssClass="button" runat="server" OnClick="fgbshow_Click" Text="Show" />
        
    
    </div>
    </form>
</body>
</html>
