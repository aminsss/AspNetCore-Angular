
namespace AspNetCoreWithAngular.DataLayer
{
    using AspNetCoreWithAngular.DomainClasses;
    using AspNetCoreWithAngular.DataLayer.EntityConfigurations;
    using Microsoft.EntityFrameworkCore;


    public class AppDbContext : DbContext
    {
        // Your context has been configured to use a 'ApplicationDbContext' connection string from your application's 
        // configuration file (App.config or Web.config). By default, this connection string targets the 
        // 'Koshop.DataLayer.ApplicationDbContext' database on your LocalDb instance. 
        // 
        // If you wish to target a different database and/or database provider, modify the 'ApplicationDbContext' 
        // connection string in the application configuration file.
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        { }

        
        public virtual DbSet<Role> Roles { get; set; }
       
        public virtual DbSet<User> Users { get; set; }


        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.ApplyConfiguration(new UserConfig());

            base.OnModelCreating(builder);

        }
    }
}

