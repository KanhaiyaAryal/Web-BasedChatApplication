<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web_BasedChatApplication.Account.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="UTF-8"/>
  <title>Log in Form</title>
  <link rel='stylesheet' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'/>
    <link href="../Content/loginStyle.css" rel="stylesheet" />

</head>
<body>
    <div class="wrapper">
     
    <form class="form-signin" runat="server">     
      <h2 class="">Login</h2>
        <div class="form-group">
        <label for="userName">User Name</label>
            <asp:TextBox ID="userName" runat="server" CssClass="form-control" placeholder="User Name"></asp:TextBox>     
            <asp:RequiredFieldValidator runat="server" ControlToValidate="userName"
                                CssClass="text-danger" ErrorMessage="The user name field is required." ID="Test"/> 
      </div>      
        <div class="form-group">
        <label for="password">Password</label>
        <asp:TextBox ID="password" runat="server" CssClass="form-control" placeholder="*********" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                CssClass="text-danger" ErrorMessage="Password Field is required."/> 
      </div>  
           
      <ul class="list-inline">
          <li>
              <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn--form" OnClick="Button1_Click" style="background-color:#3a7fd8; color:white;"/>
          </li>
          <li>
            <a class="signup__link" href="/Account/Register">Create New Account</a>
          </li>
        </ul>  
    </form>

  </div>

</body>

</html>
</html>
