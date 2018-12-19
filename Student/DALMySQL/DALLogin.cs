using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using Student.ModelStu;
using System.Data;
using Student.IDAL;
using Student.ModelStuView;

namespace Student.DALMySQL
{
    public class DALLogin : IDALLogin
    {
        private DBHelper helper = new DBHelper();

        public int Delete(string stuGuid)
        {
            throw new NotImplementedException();
        }

        public int Insert(User stu)
        {
            throw new NotImplementedException();
        }

        public int Add(User u)
        {
            string strSQL = "  insert into dbo.Admin(AdminGuid,LoginId,LoginPwd) values( @adminGuid,@loginId,@loginPwd)";

            int count = Convert.ToInt32(helper.ExecuteNonQuery(strSQL, CommandType.Text, new MySqlParameter("@loginId", u.LoginId),
                     new MySqlParameter("@loginPwd", u.LoginPwd), new MySqlParameter("@AdminGuid", u.Guid)));

            return count;
        }

        public int QueryFirst(User u)
        {
            string strSQL = "select COUNT(*) from Admin where LoginId = @loginId";

            int count = Convert.ToInt32(helper.ExecuteScalar(strSQL, CommandType.Text, new MySqlParameter("@loginId", u.LoginId)));
            return count;
        }

        public int Login(User u)
        {
            string strSQL = "select COUNT(*) from Admin where LoginId = @LoginId and LoginPwd = @LoginPwd";

            int count = Convert.ToInt32(helper.ExecuteScalar(strSQL, CommandType.Text,
                    new MySqlParameter("@LoginId", u.LoginId),
                    new MySqlParameter("@loginPwd", u.LoginPwd)));

            string strSQLGUID = "select AdminGUID from Admin where LoginId = @loginId and LoginPwd = @loginPwd";
            IDataReader reader = helper.ExecuteReaderAsync(strSQLGUID, CommandType.Text, new MySqlParameter("@loginId", u.LoginId),
                    new MySqlParameter("@loginPwd", u.LoginPwd)).Result;

            if (reader.Read())
            {
                u.Guid = reader["AdminGUID"].ToString();
                reader.Close();
            }

            return count;
        }

        public IEnumerable<User> QueryAll(StudentQueryParameter p)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<User>> QueryAllAsync(StudentQueryParameter p)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<User> QueryByStuGuid(StudentQueryParameter p)
        {
            throw new NotImplementedException();
        }

        public int Updata(User stu)
        {
            throw new NotImplementedException();
        }

        public int UpdataPwd(string stuGuid, string pwd)
        {
            throw new NotImplementedException();
        }
    }
}
