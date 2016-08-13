using Blog.DataAccess.Common.Interfaces;
using Blog.DataAccess.Data.Blogging;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.DataAccess.Common
{
    public abstract class Repository<T> : IRepository<T>
        where T : class
    {
        protected DbContext _entities;
        protected readonly IDbSet<T> _dbset;

        public Repository(Blogging dbContext)
        {
            _entities = dbContext;
            _dbset = dbContext.Set<T>();
        }

        public virtual IEnumerable<T> GetAll()
        {
            return _dbset.AsEnumerable<T>();
        }

        public IEnumerable<T> FindBy(System.Linq.Expressions.Expression<Func<T, bool>> predicate)
        {
            IEnumerable<T> query = _dbset.Where(predicate).AsEnumerable();
            return query;
        }

        public T Add(T entity)
        {
            return _dbset.Add(entity);
        }

        public T Delete(T entity)
        {
            return _dbset.Remove(entity);
        }

        public void Edit(T entity)
        {
            _dbset.Attach(entity);
            _entities.Entry(entity).State = EntityState.Modified;
            Save();
        }

        public void Save()
        {
            _entities.SaveChanges();
        }
    }
}
