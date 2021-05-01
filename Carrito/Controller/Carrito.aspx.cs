using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Carrito : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GV_Carrito_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.FindControl("L_Total") != null)
        {
            Carrito carro = (Carrito)e.Row.DataItem;
            double total = carro.Precio * carro.Cantidad.Value;
            ((Label)e.Row.FindControl("L_Precio")).Text = total.ToString();

            GridView compras = (GridView)e.Row.FindControl("Gv_Compras");

            ObjectDataSource ods = (ObjectDataSource)e.Row.FindControl("ODS_Compras");
            ods.SelectParameters["productoId"] = new Parameter("productoId", DbType.Int32, carro.ProductoId.ToString());
            compras.DataBind();

            //compras.DataSource = new DaoProducto().obtenerComprasxProducto(carro.ProductoId);
            //compras.DataBind();

        }
        else if(e.Row.RowType.ToString().Equals("Footer"))
        {
            ((Label)e.Row.FindControl("L_TFinal")).Text = string.Format("{0:C}",new DaoProducto().obtenerProductosCarrito(int.Parse(Session["userId"].ToString())).Sum(x => x.Total));
        }
    }

    protected void ODS_Compras_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        //e.InputParameters["productoId"] = 1;
    }
}