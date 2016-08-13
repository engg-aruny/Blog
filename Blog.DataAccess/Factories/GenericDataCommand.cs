using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.DataAccess.Factories
{
    using Blog.DataAccess.Factories.Interfaces;
    using System.Data;

    public abstract class GenericDataCommand<TConnection, TDataCommand, TDataAdpter> : IDataCommand
        where TConnection : IDbConnection, new()
        where TDataCommand : IDbCommand, new()
        where TDataAdpter : IDbDataAdapter, new()
    {
        #region Protected Properties
        protected IDbConnection Connection { get; set; }

        protected IDbCommand Command { get; set; }

        protected IDbTransaction Transaction { get; set; }

        #endregion

        #region Public Properties
        public string ConnectionString { get; set; }

        public bool BeginTransaction { private get; set; }

        public string CommandText { get; set; }

        public int? CommandTimeOut { get; set; }

        public CommandType CommandType { get; set; }

        public IDataParameter Parameters { get; set; }

        #endregion

        #region Virtual Method

        public virtual void SetConnection()
        {
            if (Transaction == null)
            {
                Connection = new TConnection();
                Connection.ConnectionString = ConnectionString;
                Connection.Open();
                if (BeginTransaction)
                {
                    Transaction = Connection.BeginTransaction(IsolationLevel.ReadUncommitted);
                }
            }
        }

        public virtual void SetCommand()
        {
            Command = new TDataCommand();
            Command.CommandText = CommandText;
            Command.CommandType = CommandType;
            Command.CommandTimeout = CommandTimeOut.GetValueOrDefault(600);
            if (Transaction != null)
            {
                Command.Transaction = Transaction;
            }
            if (Parameters == null)
            {
                return;
            }
            Command.Parameters.Add(Parameters);
        }

        /// <summary>
        /// </summary>
        protected void CloseConnection()
        {
            if (Transaction == null)
            {
                if (Connection != null && Connection.State != ConnectionState.Closed)
                {
                    Connection.Close();
                    Connection.Dispose();
                }

                Connection = null;
            }
        }

        /// <summary>
        /// Closes the command object.
        /// </summary>
        protected void CloseCommand()
        {
            if (Command == null)
            {
                return;
            }
            Command.Dispose();
            Command = null;
        }

        #endregion

        #region Public Method
        public IDataReader Execute(
            string commandText,
            CommandType commandType,
            CommandBehavior? commandBehavior = CommandBehavior.CloseConnection)
        {
            try
            {
                CommandText = commandText;
                CommandType = commandType;

                SetConnection();
                SetCommand();
                IDataReader results = Command.ExecuteReader(commandBehavior.Value);
                return results;
            }
            catch (Exception)
            {
                RollBackTransaction();
                CloseCommand();
                CloseConnection();
                throw;
            }

        }
        /// <summary>
        /// </summary>
        public IDataReader Execute()
        {
            return Execute(CommandText, CommandType);
        }

        public int ExecuteNonQuery(string commandText, CommandType commandType)
        {
            var rowAffected = 0;
            try
            {
                CommandText = commandText;
                CommandType = commandType;
                rowAffected = Command.ExecuteNonQuery();

            }
            catch (Exception)
            {
                RollBackTransaction();
                throw;
            }
            finally
            {
                CloseCommand();
                CloseConnection();
            }
            return rowAffected;
        }

        /// <summary>
        /// </summary>
        public void CommitTransaction()
        {
            if (Transaction != null)
            {
                Transaction.Commit();
                Transaction.Dispose();
                Transaction = null;
                CloseConnection();
            }
        }

        /// <summary>
        /// </summary>
        public void RollBackTransaction()
        {
            if (Transaction == null)
            {
                return;
            }

            Transaction.Rollback();
            Transaction.Dispose();
            Transaction = null;
        }

        /// <summary>
        /// </summary>
        public void Dispose()
        {
            if (null != Connection)
            {
                Connection.Dispose();
            }

            if (null != Command)
            {
                Command.Dispose();
            }

            if (null != Transaction)
            {
                Transaction.Dispose();
            }
        }

        #endregion

        #region Private Method

        #endregion
    }
}
