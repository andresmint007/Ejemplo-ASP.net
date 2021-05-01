using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

/// <summary>
/// Descripción breve de Producto
/// </summary>
/// 
[Serializable]
[Table("compras_proveedor", Schema = "productos")]
public class CompraProveedor
{
    private int id;
    private int proveedorId;
    private int productoId;
    private int cantidad;
    private double precioCompra;
    private double total;
    private string proveedorNombre;

    [Key]
    [Column("id")]
    public int Id { get => id; set => id = value; }
    [Column("proveedor_id")]
    public int ProveedorId { get => proveedorId; set => proveedorId = value; }
    [Column("producto_id")]
    public int ProductoId { get => productoId; set => productoId = value; }
    [Column("cantidad")]
    public int Cantidad { get => cantidad; set => cantidad = value; }
    [Column("precio_compra")]
    public double PrecioCompra { get => precioCompra; set => precioCompra = value; }
    [NotMapped]
    public double Total { get => total; set => total = value; }
    [NotMapped]
    public string ProveedorNombre { get => proveedorNombre; set => proveedorNombre = value; }
}