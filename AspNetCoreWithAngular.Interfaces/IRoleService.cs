using AspNetCoreWithAngular.DomainClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspNetCoreWithAngular.Interfaces
{
    public interface IRoleService
    {
        Task<IEnumerable<Role>> Roles();
    }
}
