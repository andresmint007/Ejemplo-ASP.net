using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DaoProducto
/// </summary>
public class DaoProducto
{
   public List<Producto> obtenerProductos()
    {
        using (var db = new Mapeo())
        {
            return db.producto.ToList();
        }
    }

    public List<Carrito> obtenerProductosCarrito(int userId)
    {
            using (var db = new Mapeo())
            {
                return (from car in db.carrito
                        join p in db.producto on car.ProductoId equals p.Id
                        where car.UserId == userId
                        select new
                        {
                            car,
                            p
                        }).ToList().Select(m => new Carrito
                        {
                            Id = m.car.Id,
                            Cantidad = m.car.Cantidad,
                            Url = m.p.Imagen,
                            NombreProducto = m.p.Nombre,
                            Fecha = m.car.Fecha,
                            ProductoId = m.car.ProductoId,
                            UserId = m.car.UserId,
                            Precio = m.p.Precio,
                            Total = m.p.Precio * m.car.Cantidad.Value
                        }).ToList();
            }
    }

    public List<CompraProveedor> obtenerComprasxProducto(int productoId)
    {
        using (var db = new Mapeo())
        {
            return (from compra in db.compra
                    join p in db.producto on compra.ProductoId equals p.Id
                    join pr in db.proveedor on compra.ProveedorId equals pr.Id
                    where compra.ProductoId == productoId
                    select new
                    {
                        compra,
                        p,
                        pr
                    }).ToList().Select(m => new CompraProveedor
                    {
                        Id = m.compra.Id,
                        Cantidad = m.compra.Cantidad,
                        ProductoId = m.compra.ProductoId,
                        PrecioCompra = m.compra.PrecioCompra,
                        Total = m.compra.PrecioCompra * m.compra.Cantidad,
                        ProveedorNombre = m.pr.Nombre
                    }).ToList();
        }
    }


    public List<Producto> obtenerProductos2()
    {
        using (var db = new Mapeo())
        {
            return (from prod in db.producto
                    let _cantCarrito = (from ss in db.carrito where ss.ProductoId == prod.Id select ss.Cantidad).Sum()
                    select new
                    {
                        prod,
                        _cantCarrito
                    }).ToList().Select(m => new Producto
                    {
                        Id = m.prod.Id,
                        Cantidad = m.prod.Cantidad - (m._cantCarrito.HasValue ? m._cantCarrito.Value : 0),
                        Imagen = m.prod.Imagen,
                        Nombre = m.prod.Nombre,
                        Precio = m.prod.Precio
                    }).ToList();
        }
    }

    public int obtenerCantidadxProdcuto(int productoId)
    {
        using (var db = new Mapeo())
        {
            Nullable<int> carrito = db.carrito.Where(x => x.ProductoId == productoId).Sum(x => x.Cantidad);
            int cantidad = db.producto.Where(x => x.Id == productoId).Select(x => x.Cantidad).First();
            return cantidad - (carrito != null? carrito.Value : 0);
        }
    }

    public void agregarCarrito(Carrito carrito)
    {
        using (var db = new Mapeo())
        {
            db.carrito.Add(carrito);
            db.SaveChanges();
        }
    }

    public int obtenerCantidadProdcutoxUser(int userId)
    {
        using (var db = new Mapeo())
        {
            return db.carrito.Where(x => x.UserId == userId).Count();
        }
    }

}