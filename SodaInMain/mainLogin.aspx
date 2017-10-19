<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mainLogin.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory System</title>
    <link rel="stylesheet" type="text/css" href="CSS/StyleSheet.css" />
    <link rel="icon" href="https://cdn2.iconfinder.com/data/icons/scrap/Administrator.png"/>
 
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    
    <style type="text/css">
        .auto-style2 {
            width: 146px;
        }
        .auto-style3 {
            width: 120px;
        }
    </style>
    
</head>
<body>     
    <form id="form1" runat="server">
     
         <div id="formclass">
        <img  src="https://cdn2.iconfinder.com/data/icons/snipicons/500/lock-128.png" id="lock"/>
        <br /> <br />
              <div class="input-group">

                  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                  <asp:TextBox ID="TextUser" Class="form-control" Height="50px" Width="100%" requiredplaceholder="User Name" runat="server"></asp:TextBox><br /> <br />
             </div>
             <br />
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <asp:TextBox ID="TextPass" Class="form-control" Height="50px" Width="100%" requiredplaceholder="Password" TextMode="Password"  runat="server"></asp:TextBox><br /> <br />
            </div>
            <br />
              <asp:Panel ID="Panel1" runat="server" BackColor="Red" Height="24px" Visible="False">
                  <table style="width:100%; height: 21px;">
                      <tr>
                          <td class="auto-style3">&nbsp;</td>
                          <td>
                              <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="15pt" Text="Login Failed!" Visible="False"></asp:Label>
                          </td>
                          <td>&nbsp;</td>
                      </tr>
                      <tr>
                          <td class="auto-style3">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                      </tr>
                      <tr>
                          <td class="auto-style3">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                      </tr>
                  </table>
             </asp:Panel>
              <br />
         <asp:Button  ID="Button1"  Class="btn btn-info" width="100%" Height="40px" runat="server" Text="Login" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
