<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: left;
            width: 183px;
        }
        .auto-style3 {
            text-align: left;
        }
        .auto-style4 {
            text-align: right;
            width: 183px;
        }
        .auto-style5 {
            width: 200px;
        }
        .auto-style6 {
            width: 200px;
            text-align: left;
        }
        .auto-style7 {
            width: 63px;
        }
    </style>
     
</head>
<body>
    <center><h1>REGISTRATION PAGE</h1></center>

    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">User Name:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="userNameBox" runat="server" Width="190px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="userNameBox" ErrorMessage="User Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Email:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="eMailBox" runat="server" Width="190px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="eMailBox" ErrorMessage="Email is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    .<br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="eMailBox" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Password:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="passwordBox" runat="server" TextMode="Password" Width="190px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="passwordBox" ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Confirm Passrword:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="cPasswordBox" runat="server" TextMode="Password" Width="190px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="cPasswordBox" ErrorMessage="Confirm Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    .<br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="passwordBox" ControlToValidate="cPasswordBox" ErrorMessage="Both password must be same" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Country </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="DropDownListCountry" runat="server" Width="190px">
                        <asp:ListItem>-SELECT COUNTRY-</asp:ListItem>
                        <asp:ListItem>Usa</asp:ListItem>
                        <asp:ListItem>Japan</asp:ListItem>
                        <asp:ListItem>Africa</asp:ListItem>
                        <asp:ListItem>China</asp:ListItem>
                        <asp:ListItem>Philippines</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownListCountry" ErrorMessage="Country is required" ForeColor="Red" InitialValue="SELECT COUNTRY" Visible="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="Reset1" class="auto-style7" type="reset" value="reset" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
