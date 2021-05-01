<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Controller/Catalogo.aspx.cs" Inherits="View_Catalogo" %>

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
        .auto-style3 {
            font-weight: normal;
            text-align: center;
            font-size: xx-large;
        }
        .auto-style4 {
            width: 85px;
        }
        .auto-style5 {
            height: 22px;
        }
        .auto-style6 {
            text-align: right;
        }
        .auto-style7 {
            font-size: medium;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>
                        <h1 class="auto-style3"><strong>Catalogo de Productos</strong></h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <div>
                            <strong>
                            <asp:Label ID="L_Cantidad" runat="server" CssClass="auto-style7" Font-Names="Calibri" ForeColor="Red"></asp:Label>
                            </strong>
                        </div>
                        <asp:ImageButton ID="IB_Carrito" runat="server" ImageUrl="~/Imagenes/Carrito.jpg" Width="2%" OnClick="IB_Carrito_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:DataList ID="DL_Productos" runat="server" DataSourceID="ODS_Productos" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DL_Productos_ItemCommand" DataKeyField="Id">
                            <ItemTemplate>
                                <table class="auto-style1" style="border-style: solid">
                                    <tr>
                                        <td colspan="2">
                                            <asp:Label ID="L_Nombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Image ID="I_Producto" runat="server" Width="35%" ImageUrl='<%# Eval("Imagen") %>' ImageAlign="Middle"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style4">Precio:</td>
                                        <td>
                                            <asp:Label ID="L_Precio" runat="server" Text='<%# Eval("Precio","{0:C}") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style4">
                                            <asp:Label ID="L_Cantidad" runat="server" Text="Stock"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="L_Disponible" runat="server" Text='<%# Eval("Cantidad") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style5">
                                            Cantidad</td>
                                        <td class="auto-style5">
                                            <asp:TextBox ID="TB_Cantidad" runat="server" TextMode="Number" Width="20%"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RFV_Cantidad" runat="server" ControlToValidate="TB_Cantidad" ErrorMessage="*" ValidationGroup='<%# Eval("Id") %>'></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style5" colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:ImageButton ID="IB_Carrito" runat="server" CommandArgument='<%# Eval("Id") %>' ImageUrl="~/Imagenes/Carrito.jpg" Width="12%" ValidationGroup='<%# Eval("Id") %>' />
                                        </td>
                                    </tr>
                                </table>
<br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:ObjectDataSource ID="ODS_Productos" runat="server" SelectMethod="obtenerProductos2" TypeName="DaoProducto"></asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
