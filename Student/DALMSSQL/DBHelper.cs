using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace Student.DALMSSQL
{
    public class DBHelper
    {
        public DBHelper()
        {
            con = new SqlConnection(strCon);
            cmd = new SqlCommand();

            cmd.Connection = con;
        }

        private string strCon = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;

        private IDbConnection con = null;
        private IDbCommand cmd = null;

        public object ExecuteScalar(string strSQL, CommandType commandType = CommandType.Text, params IDataParameter[] parameters)
        {
            object obj = null;

            try
            {
                this.cmd.CommandText = strSQL;
                this.cmd.CommandType = commandType;
                this.cmd.Parameters.Clear();
                foreach (var item in parameters)
                {
                    this.cmd.Parameters.Add(item);
                }

                this.con.Open();

                obj = this.cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                this.con.Close();
            }

            return obj;

        }

        public Task<object> ExecuteScalarAsync(string strSQL, CommandType commandType = CommandType.Text, params IDataParameter[] parameters)
        {
            return Task<object>.Run(() =>
            {
                return ExecuteScalar(strSQL, commandType, parameters);
            });

        }

        public int ExecuteNonQuery(string strSQL, CommandType commandType = CommandType.Text, params IDataParameter[] parameters)
        {
            int rows = 0;

            try
            {
                this.cmd.CommandText = strSQL;
                this.cmd.CommandType = commandType;
                this.cmd.Parameters.Clear();
                foreach (var item in parameters)
                {
                    this.cmd.Parameters.Add(item);
                }

                this.con.Open();

                rows = this.cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                this.con.Close();
            }

            return rows;

        }

        public Task<int> ExecuteNonQueryAsync(string strSQL, CommandType commandType = CommandType.Text, params IDataParameter[] parameters)
        {
            return Task<int>.Run(() =>
            {
                return ExecuteNonQuery(strSQL, commandType, parameters);
            });
        }


        public IDataReader ExecuteReader(string strSQL, CommandType commandType = CommandType.Text, params IDataParameter[] parameters)
        {
            IDataReader reader = null;
            try
            {
                this.cmd.CommandText = strSQL;
                this.cmd.CommandType = commandType;
                this.cmd.Parameters.Clear();
                foreach (var item in parameters)
                {
                    this.cmd.Parameters.Add(item);
                }

                this.con.Open();

                reader = this.cmd.ExecuteReader(CommandBehavior.CloseConnection);
            }
            catch (Exception ex)
            {

                throw ex;
            }

            return reader;

        }

        public Task<IDataReader> ExecuteReaderAsync(string strSQL, CommandType commandType = CommandType.Text, params IDataParameter[] parameters)
        {
            return Task<IDataReader>.Run(() =>
            {
                return ExecuteReader(strSQL, commandType, parameters);
            });
        }
    }
}
