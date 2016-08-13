using Blog.DataAccess.Factories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.DataAccess.Factories
{
    /// <summary>
    /// The DataCommandFactory is utilized to create new instances of 
    /// DataCommand objects. This class hides the logic necessary to instantiate
    /// the appropriate type of DataCommand object and to initialize it.
    /// </summary>
    public static class DataCommandFactory
    {
        #region Public Method

        public static IDataCommand GetInstance(string connectionString)
        {
            if(string.IsNullOrEmpty(connectionString))
            {
                throw new Exception("Connection string must be supplied");
            }

            return new SqlDataBaseCommand(connectionString);
        }
        #endregion
    }
}
