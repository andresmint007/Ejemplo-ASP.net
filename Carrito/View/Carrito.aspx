<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Controller/Carrito.aspx.cs" Inherits="View_Carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:GridView ID="GV_Carrito" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ODS_Carrito" ForeColor="#333333" GridLines="None" OnRowDataBound="GV_Carrito_RowDataBound" DataKeyNames="ProductoId" ShowFooter="True">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField HeaderText="Producto" SortExpression="Url">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Url") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <table class="auto-style1">
                                            <tr>
                                                <td class="auto-style2">
                                                    <asp:Image ID="I_Producto" runat="server" Width="20%" ImageUrl='<%# Bind("Url") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">
                                                    <asp:Label ID="L_Prodcuto" runat="server" Text='<%# Bind("NombreProducto") %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle Width="40%" />
                                    
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Precio" SortExpression="Precio">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Precio") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="L_Precio" runat="server" Text='<%# Bind("Precio","{0:C}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cantidad" SortExpression="Cantidad">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Cantidad") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="L_Cantidad" runat="server" Text='<%# Bind("Cantidad") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total" SortExpression="Total">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Total") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <table class="auto-style1">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="L_Final" runat="server" Text="Total de la compra:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="L_TFinal" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="L_Total" runat="server" Text='<%# Bind("Total","{0:C}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Compras">
                                    <ItemTemplate>
                                        <asp:GridView ID="GV_Compras" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="ODS_Compras" GridLines="Vertical">
                                            <AlternatingRowStyle BackColor="#DCDCDC" />
                                            <Columns>
                                                <asp:BoundField DataField="ProveedorNombre" HeaderText="ProveedorNombre" SortExpression="ProveedorNombre" />
                                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                                                <asp:BoundField DataField="PrecioCompra" HeaderText="PrecioCompra" SortExpression="PrecioCompra" />
                                                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#000065" />
                                        </asp:GridView>
                                        <asp:ObjectDataSource ID="ODS_Compras" runat="server" OnSelecting="ODS_Compras_Selecting" SelectMethod="obtenerComprasxProducto" TypeName="DaoProducto">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="GV_Carrito" Name="productoId" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ODS_Carrito" runat="server" SelectMethod="obtenerProductosCarrito" TypeName="DaoProducto">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="0" Name="userId" SessionField="userId" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
