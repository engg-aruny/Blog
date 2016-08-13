using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.DataAccess.Factories
{
    public class SqlDataBaseCommand : GenericDataCommand<SqlConnection, SqlCommand, SqlDataAdapter>
    {
        public SqlDataBaseCommand(string connectionString)
        {
            ConnectionString = connectionString;
        }
    }
}
