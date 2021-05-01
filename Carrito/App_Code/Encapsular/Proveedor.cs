using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

/// <summary>
/// Descripción breve de Producto
/// </summary>
/// 
[Serializable]
[Table("proveedor", Schema = "productos")]
public class Proveedor
{
    private int id;
    private string nombre;

    [Key]
    [Column("id")]
    public int Id { get => id; set => id = value; }
    [Column("nombre")]
    public string Nombre { get => nombre; set => nombre = value; }
}