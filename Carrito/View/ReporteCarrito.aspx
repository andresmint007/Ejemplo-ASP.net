<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Controller/ReporteCarrito.aspx.cs" Inherits="View_ReporteCarrito" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Reporte</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2">
                        <CR:CrystalReportViewer ID="CRV_Carrito" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" ReportSourceID="CRS_Carrito" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="1104px" HasRefreshButton="True" />
                        <CR:CrystalReportSource ID="CRS_Carrito" runat="server">
                            <Report FileName="C:\Users\Desarrollo\Documents\ISW I 2020 I\Carrito Compras\Carrito\Carrito\Reportes\Carrito.rpt">
                            </Report>
                        </CR:CrystalReportSource>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
