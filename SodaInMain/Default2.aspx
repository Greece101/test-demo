<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #dgv1{
            margin-left: 15%;
        }
        #wow{
            margin-left: 30%;
        }
        #wew{
            margin-left:81%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            &nbsp;
        
        <asp:Label ID="wow" runat="server" Text="Canteen Stocks during September 25-28" Font-Bold="false" ForeColor="SteelBlue" Font-Size="XX-Large"></asp:Label><br />
            <asp:Button ID="wew" Text="Refresh" runat="server" BorderStyle="Double" BorderWidth="3px" BackColor="SteelBlue" OnClick="Unnamed1_Click" />
            <asp:GridView ID="dgv1" runat="server" AutoGenerateColumns="False"
                ShowHeaderWhenEmpty="True" ShowFooter="True" DataKeyNames="ProductID"
                BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                CellPadding="4" OnPageIndexChanging="dgv1_PageIndexChanging"
                OnRowCommand="dgv1_RowCommand" OnRowEditing="dgv1_RowEditing"
                OnRowCancelingEdit="dgv1_RowCancelingEdit" OnRowUpdating="dgv1_RowUpdating"
                OnRowDeleting="dgv1_RowDeleting" AllowPaging="True" PageSize="7" PagerSettings-Mode="NextPrevious">
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
                 <PagerSettings Mode="NextPrevious" Position="Bottom" PageButtonCount="7" />
              

                <Columns>
           
                    <asp:TemplateField HeaderText="Product ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtpid" Text='<%# Eval("ProductID") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtpidfooter" runat="server" Enabled="false" TextMode="Number" MaxLength="50"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Product Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtpname" Text='<%# Eval("ProductName") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtpnamefooter" runat="server" OnTextChanged="txtpnamefooter_TextChanged" AutoPostBack="true" MaxLength="50"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Product Type">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("ProductType") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtptype" Text='<%# Eval("ProductType") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtptypefooter" type="alphanumeric" runat="server" OnTextChanged="txtptypefooter_TextChanged" AutoPostBack="true" 
                                 MaxLength="50"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtprice" Text='<%# Eval("Price") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtpricefooter" type="number" runat="server"  MaxLength="10"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Stocks">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtstocks" Text='<%# Eval("Stock") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtstocksfooter" type="number" runat="server" MaxLength="4"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/edit.png" Height="20px" Width="20px" ToolTip="Edit" runat="server" CommandName="Edit" />
                            <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/-Delete-icon.png" Height="20px" Width="20px" ToolTip="Delete"
                                 runat="server" CommandName="Delete" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Update" ImageUrl="~/images/save.png" Height="20px" Width="20px" />
                            <asp:ImageButton ID="ImageButton4" runat="server" CommandName="Cancel" ImageUrl="~/images/cancel_318-131690.jpg" Height="20px" Width="20px" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ID="ImageButton5" runat="server" CommandName="Add" ImageUrl="~/images/Add-icon.png" Height="20px" Width="20px" ToolTip="Add" />
                        </FooterTemplate>

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button ID="Button1" runat="server" OnClientClick="javascript:window.close();" Text="Back" /><br />
            <asp:Label ID="success" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="error" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
