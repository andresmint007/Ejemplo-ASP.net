using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

/// <summary>
/// Descripción breve de Producto
/// </summary>
/// 
[Serializable]
[Table("carrito", Schema = "productos")]
public class Carrito
{
    private int id;
    private int productoId;
    private Nullable<int> cantidad;
    private DateTime fecha;
    private int userId;

    private string nombreProducto;
    private string url;
    private double precio;
    private double total;
    

    [Key]
    [Column("id")]
    public int Id { get => id; set => id = value; }
    [Column("producto_id")]
    public int ProductoId { get => productoId; set => productoId = value; }
    [Column("cantidad")]
    public Nullable<int> Cantidad { get => cantidad; set => cantidad = value; }
    [Column("fecha")]
    public DateTime Fecha { get => fecha; set => fecha = value; }
    [Column("user_id")]
    public int UserId { get => userId; set => userId = value; }
    [NotMapped]
    public string NombreProducto { get => nombreProducto; set => nombreProducto = value; }
    [NotMapped]
    public string Url { get => url; set => url = value; }
    [NotMapped]
    public double Precio { get => precio; set => precio = value; }
    [NotMapped]
    public double Total { get => total; set => total = value; }
}