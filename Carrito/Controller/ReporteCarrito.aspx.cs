using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_ReporteCarrito : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        pintarReporte();
    }

    protected void pintarReporte()
    {
        CRS_Carrito.ReportDocument.SetDataSource(informacionReporte());
        CRV_Carrito.ReportSource = CRS_Carrito;
    }

    protected General informacionReporte()
    {
        General informe = new General();
        List<Carrito> listCarrito = new DaoProducto().obtenerProductosCarrito(1);

        DataTable datosFinal = informe.Carrito;
        DataRow fila;

        foreach (Carrito registro in listCarrito)
        {
            fila = datosFinal.NewRow();
            fila["Id"] = registro.Id;
            fila["ProductoNombre"] = registro.NombreProducto;
            fila["ProductoImagen"] = obtenerImagen(registro.Url);
            fila["Cantidad"] = registro.Cantidad;
            fila["Precio"] = registro.Precio;
            fila["Fecha"] = registro.Fecha;
            datosFinal.Rows.Add(fila);
        }

        return informe;
    }

    protected byte[] obtenerImagen(String url)
    {
        String urlImagen = Server.MapPath(url);

        if (!System.IO.File.Exists(urlImagen))
        {
            urlImagen = Server.MapPath("~\\Imagenes\\Sistema\\" + "NoDisponible.jpg");
        }

        byte[] fileBytes = System.IO.File.ReadAllBytes(urlImagen);

        return fileBytes;

    }
}