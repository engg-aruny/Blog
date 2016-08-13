using Blog.DataAccess.Common.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.DataAccess.Common
{
    public class DbContextFactory : IDbContextFactory
    {
        #region Implementation of IDbContextFactory

        public T CreateDbContext<T>() where T : DbContext, new()
        {
            // Create a new instance of T and return.
            return new T();
        }

        #endregion
    }
}
