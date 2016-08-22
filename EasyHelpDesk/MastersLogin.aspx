<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MastersLogin.aspx.cs" Inherits="EasyHelpDesk.MastersLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        EasyTask Masters Login.
    </title>
    <style>
    * {
  margin: 0;
  padding: 0;
}

body {
  margin: 0;
  padding: 0;
  font-family: Sans-serif;
  background: #2c3e50;
}

#wrap {
  margin: 0 auto 30px;
}

#regbar {
  height: 67px;
  background: #34495e;
}

#navthing {
  margin-left: 50px;
}

h2 {
  padding: 20px;
  color: #ecf0f1;
}

fieldset {
  border: none;
}

.login {
  position: relative;
  width: 350px;
  display: none;
}

.arrow-up {
  width: 0;
  height: 0;
  border-left: 20px solid transparent;
  border-right: 20px solid transparent;
  border-bottom: 15px solid #ECF0F1;
  left: 10%;
  position: absolute;
  top: -10px;
}

.formholder {
  background: #ecf0f1;
  width: 350px;
  border-radius: 5px;
  padding-top: 5px;
}
.formholder input[type="email"], .formholder input[type="password"] {
  padding: 7px 5px;
  margin: 10px 0;
  width: 96%;
  display: block;
  font-size: 18px;
  border-radius: 5px;
  border: none;
  -webkit-transition: 0.3s linear;
  -moz-transition: 0.3s linear;
  -o-transition: 0.3s linear;
  transition: 0.3s linear;
}
.formholder input[type="email"]:focus, .formholder input[type="password"]:focus {
  outline: none;
  box-shadow: 0 0 1px 1px #1abc9c;
}
.formholder input[type="submit"] {
  background: #1abc9c;
  padding: 10px;
  font-size: 20px;
  display: block;
  width: 100%;
  border: none;
  color: #fff;
  border-radius: 5px;
}
.formholder input[type="submit"]:hover {
  background: #1bc6a4;
}

.randompad {
  padding: 10px;
}

.green {
  color: #1abc9c;
}

a {
  color: #ecf0f1;
  text-decoration: none;
}
a:hover {
  color: #1abc9c;
}
.Info{
    padding-left:156px;
}
.ustinfo{
    border-bottom-left-radius:10px;
    border-bottom-right-radius:10px;
    border-top-left-radius:10px;
    border-top-right-radius:10px;
    font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
    font-size:28px;
    box-shadow:10px 10px black;
}
.usbinfo{
    font-family:Consolas;
    font-size:20px;
    background-color:ButtonHighlight;
    border-bottom-left-radius:20px;
    border-top-right-radius:20px;
    box-shadow:10px 10px black;
    }
        .usbinfo:hover {
            /*background: white;
            border: solid 1px grey;
            font-family: Arial, sans-serif;
            font-size: 12px;*/
            font-weight: bold;
            color: darkblue;
            cursor:pointer;
            /*height: 25px;*/
        }
        .forgot {
            /*margin-top: -20px;*/
            /*text-align: right;*/
            padding: 50px;
        }
   
    </style>
    <%-- <script type="text/javascript">
        history.forward();
</script>--%>
</head>
<body>
    <form id="form1" runat="server">
     
          
    <div id="wrap">
  <div id="regbar">
    <div id="navthing">
      <h2>
          <a href="#" id="loginform">EasyTask Master Login</a>|<a href="login.aspx">Back</a> </h2>
    <div class="login">
      <div class="arrow-up"></div>
      <div class="formholder">
          
      </div>
    </div>
    </div>
  </div>
</div>
        <div class="msusinfo"> <asp:Label ID="usnl" runat="server" Text="USERNAME" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="22px" ForeColor="#0EC641" CssClass="Info" ></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="MLDDLuname" runat="server" CssClass="ustinfo" DataSourceID="msluname" DataTextField="UserLoginId" DataValueField="UserLoginId" Width="284px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="msluname" runat="server" ConnectionString="<%$ ConnectionStrings:EasyTaskConnectionString %>" SelectCommand="SELECT DISTINCT [UserLoginId] FROM [UserInfo] WHERE ([MasterLogin] = @MasterLogin)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="MLDDLuname" DefaultValue="1" Name="MasterLogin" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <asp:Label ID="usnp" runat="server" Text="PASSWORD" Font-Bold="True" Font-Names="Franklin Gothic Medium" Font-Size="22px" ForeColor="#0EC641" CssClass="Info" ></asp:Label>&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="ustupass" runat="server" CssClass="ustinfo" Width="284px" TextMode="Password" ToolTip="Password" OnTextChanged="ustupass_TextChanged"></asp:TextBox>
            <br />
            <br />
             <br />
            <a class="forgot" href="ForgetPassword.aspx">Forgot Password</a><%--</>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="usblogin" runat="server" Text="Login" CssClass="usbinfo" Width="112px" ToolTip="Login" OnClick="usblogin_Click"/>
        </div>
	   </form>
    
</body>
</html>
