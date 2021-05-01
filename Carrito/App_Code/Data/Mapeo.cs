using System.Data.Entity;
/// <summary>
/// Descripción breve de Mapeo
/// </summary>
public class Mapeo : DbContext
{
    static Mapeo()
    {
        Database.SetInitializer<Mapeo>(null);
    }
    private readonly string schema;

    public Mapeo()
           : base("name=Conexion2")
    {

    }

    public DbSet<Producto> producto { get; set; }
    public DbSet<Carrito> carrito { get; set; }
    public DbSet<Proveedor> proveedor { get; set; }
    public DbSet<CompraProveedor> compra { get; set; }

    protected override void OnModelCreating(DbModelBuilder builder)
    {
        builder.HasDefaultSchema(this.schema);

        base.OnModelCreating(builder);
    }
}