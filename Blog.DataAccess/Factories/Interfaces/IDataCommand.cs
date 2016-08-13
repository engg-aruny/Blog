using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.DataAccess.Factories.Interfaces
{
    public interface IDataCommand : IDisposable
    {
        /// <summary>
        /// </summary>
        bool BeginTransaction { set; }

        /// <summary>
        /// </summary>
        string CommandText { get; set; }

        /// <summary>
        /// </summary>
        int? CommandTimeOut { get; set; }

        /// <summary>
        /// </summary>
        CommandType CommandType { get; set; }

        /// <summary>
        /// </summary>
        string ConnectionString { get; }

        /// <summary>
        /// </summary>
        void CommitTransaction();

        /// <summary>
        /// </summary>
        void RollBackTransaction();

        /// <summary>
        /// </summary>
        IDataReader Execute();
    }
}
