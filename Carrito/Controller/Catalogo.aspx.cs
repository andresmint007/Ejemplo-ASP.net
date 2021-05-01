using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Catalogo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["userId"] = 1;
        L_Cantidad.Text = new DaoProducto().obtenerCantidadProdcutoxUser(1).ToString();
    }

    protected void DL_Productos_ItemCommand(object source, DataListCommandEventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        int stock = int.Parse(((Label)e.Item.FindControl("L_Disponible")).Text);
        int cantidadSolicitada = int.Parse(((TextBox)e.Item.FindControl("TB_Cantidad")).Text);
        int cantidadDisponible = new DaoProducto().obtenerCantidadxProdcuto(int.Parse(e.CommandArgument.ToString()));

        if (e.Item.FindControl("TB_Cantidad") != null || cantidadSolicitada > cantidadDisponible)
        {
            if(cantidadSolicitada > stock)
            {
                cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Cantidad No disponible. Disponible:');</script>");
                //this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Cantidad No disponible. Disponible: '" + cantidadDisponible.ToString() + "');</script>");
                return;
            }

            Carrito agregar = new Carrito();
            agregar.ProductoId = int.Parse(e.CommandArgument.ToString());
            agregar.UserId = int.Parse(Session["userId"].ToString());
            agregar.Cantidad = cantidadSolicitada;
            agregar.Fecha = DateTime.Now;

            new DaoProducto().agregarCarrito(agregar);
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Producto agregado a Carrito.');</script>");
            Response.Redirect("Catalogo.aspx");
            
        }

    }

    protected void IB_Carrito_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Carrito.aspx");
    }
}