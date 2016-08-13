using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.DataAccess.Common.Interfaces
{
    public interface IDbContextFactory
    {
        T CreateDbContext<T>() where T : DbContext, new();
    }
}
