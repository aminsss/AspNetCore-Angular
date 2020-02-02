using AspNetCoreWithAngular.DataLayer;
using AspNetCoreWithAngular.DomainClasses;
using AspNetCoreWithAngular.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace AspNetCoreWithAngular.ServiceLayer
{
    public class EfRoleService : RepositoryBase<Role> ,IRoleService
    {
        public EfRoleService(AppDbContext contex)
       : base(contex)
        {
        }

        public async Task<IEnumerable<Role>> Roles() =>
              await FindAll().ToListAsync();
    }
}
