<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="sales2.aspx.cs" Inherits="sales2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 420px;
        }
        .auto-style2 {
            width: 332px;
        }

        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <table style="width: 88%; margin-right: 0px; height: 357px;">
            <tr>
                <td class="auto-style1">
    
        <asp:GridView ID="GridView1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" runat="server" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="400px">
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkselect" runat="server" OnCheckedChanged="chkselect_CheckedChanged" AutoPostBack="true" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="ProductID" DataField="ProductID" />
                    <asp:BoundField HeaderText="ProductName" DataField="ProductName" />
                    <asp:BoundField HeaderText="Price" DataField="Price" />
                    <asp:BoundField HeaderText="Stock" DataField="Stock" />
            </Columns>
            
        </asp:GridView>

                </td>
                <td class="auto-style2"><asp:Label ID="tot" runat="server" Text=""></asp:Label>
        <asp:GridView ID="GridView2" AutoGenerateColumns="False" OnRowDataBound="GridView2_RowDataBound" EmptyDataText="No Records" ShowFooter="True"  
            runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" Width="250px" style="margin-left: 0px" 
            ForeColor="Black" GridLines="None">
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:TemplateField HeaderText="ProductID">
                    <ItemTemplate>
                        <asp:TextBox ID="id" runat="server" Enabled="false" Text='<%# Eval("ProductID") %>' Width="70px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ProductName">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server"  Text='<%# Eval("ProductName") %>' Enabled="false"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("Price") %>' Enabled="false" Width="30px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Stock">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("Stock") %>' Enabled="false" Width="30px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" type="number" OnTextChanged="TextBox1_TextChanged" AutoPostBack="true" TextMode="Number"></asp:TextBox>
                    </ItemTemplate>
                   <FooterTemplate>
                        <asp:Label ID="Label4" runat="server" Text="Total: "></asp:Label>
                    </FooterTemplate>
                    <FooterStyle HorizontalAlign="Left" />
                </asp:TemplateField>

            <asp:TemplateField HeaderText="Total">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Enabled="false" OnTextChanged="TextBox2_TextChanged" Width="30px"></asp:TextBox>
                </ItemTemplate>
                <FooterTemplate>
                        <asp:Label ID="Label3" runat="server" Text="" ></asp:Label>
                    </FooterTemplate>
            </asp:TemplateField>
            </Columns>
        </asp:GridView>
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Order" Width="56px" /> <asp:Button ID="Button3" runat="server" 
                        Text="Cancel" OnClick="Button3_Click" OnClientClick="cancel()"/>
                </td>
                <td style="margin-left: 40px"></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
    </div>
         <asp:Button ID="Button1" runat="server" OnClientClick="javascript:window.close();" Text="Back" />
                    <asp:Label ID="errorlbl" runat="server"></asp:Label>
    </form>
    <script>
        function cancel() {
            alert("Are you sure you want to cancel the order?");
        }
    </script>
   
</body>
</html>
