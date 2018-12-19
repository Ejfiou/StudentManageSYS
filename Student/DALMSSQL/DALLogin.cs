using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Student.ModelStu;
using System.Data.SqlClient;
using System.Data;
using Student.IDAL;
using Student.ModelStuView;

namespace Student.DALMSSQL
{
    public class DALLogin:IDALLogin
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

        public int Login(User u)
        {
            string strSQL = "select COUNT(*) from Admin where LoginId = @loginId and LoginPwd = @loginPwd";

            int count = Convert.ToInt32(helper.ExecuteScalar(strSQL, CommandType.Text, new SqlParameter("@loginId", u.LoginId),
                    new SqlParameter("@loginPwd", u.LoginPwd)));
            string strSQLGUID = "select AdminGUID from Admin where LoginId = @loginId and LoginPwd = @loginPwd";
            IDataReader reader = helper.ExecuteReaderAsync(strSQLGUID, CommandType.Text, new SqlParameter("@loginId", u.LoginId),
                    new SqlParameter("@loginPwd", u.LoginPwd)).Result;
            if (reader.Read())
            {
                u.Guid = reader["AdminGUID"].ToString();
                reader.Close();
            }
            return count;
        }

        public int Add(User u)
        {
            string strSQL = "insert into dbo.Admin(AdminGuid,LoginId,LoginPwd) values( @adminGuid,@loginId,@loginPwd)";

            int count = Convert.ToInt32(helper.ExecuteNonQuery(strSQL, CommandType.Text, new SqlParameter("@loginId", u.LoginId),
                     new SqlParameter("@loginPwd", u.LoginPwd), new SqlParameter("@AdminGuid", u.Guid)));
          
            return count;
        }

        public int QueryFirst(User u)
        {
            string strSQL = "select COUNT(*) from Admin where LoginId = @loginId";

            int count = Convert.ToInt32(helper.ExecuteScalar(strSQL, CommandType.Text, new SqlParameter("@loginId", u.LoginId)));
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
            string str = "	select * from Admin where AdminGuid=@AdminGuid";
            using (IDataReader reader = helper.ExecuteReader(str, CommandType.Text, new SqlParameter("@AdminGuid", p.StudentGuid)))
            {
                while (reader.Read())
                {
                    yield return new User()
                    {
                        LoginPwd = reader.GetString(reader.GetOrdinal("LoginPwd"))
                    };
                }
            }
        }

        public int Updata(User stu)
        {
            throw new NotImplementedException();
        }

        public int UpdataPwd(string stuGuid, string pwd)
        {
            string strSQL = "update Admin set LoginPwd=@LoginPwd where AdminGuid=@AdminGuid";
            return helper.ExecuteNonQuery(strSQL, CommandType.Text, new SqlParameter("@AdminGuid", stuGuid),
                new SqlParameter("@LoginPwd", pwd));
        }
    }
}
