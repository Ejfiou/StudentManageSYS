using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Student.ModelStu;
using System.Data.SqlClient;
using System.Data;
using Student.ModelStuView;
using Student.IDAL;
namespace Student.DALMSSQL
{
    public class DALStudentSeacher:IDALStudentSeacher
    {
        private DBHelper helper = new DBHelper();

        public Task<IEnumerable<Students>> QueryAllAsync(StudentQueryParameter p)
        {
            return Task<IEnumerable<Students>>.Run(() =>
            {
                return QueryAll(p);
            });
        }
        public IEnumerable<Students> QueryAll(StudentQueryParameter p)
        {
            int totalRows = 0;
            //string strSQL = "with stu as "
            //    + "(select StudentGuid,StudentNO,LoginId,UserStateId,ClassName,StudentName,Address,c.ClassGuid,Sex,LoginPwd,GradeGuid from Student s "
            //    + "left join Class c on c.ClassGuid = s.ClassGuid "
            //    + "where (LEN(@Sex)=0 or CHARINDEX(@Sex,Sex)>0) and (LEN(@ClassName)=0 or CHARINDEX(@ClassName,ClassName)>0 )and (LEN(@StudentName)=0 or CHARINDEX(@StudentName,StudentName)>0) )"
            //    + "SELECT Top (@pageMaxRowNumber) * ,'Total'=(select count(*) from stu) from stu"
            //    + " where StudentGuid not in (select top ((@pageNumber - 1) * @pageMaxRowNumber) StudentGuid from stu  order by LoginId) order by LoginId";

            //string strSQL = "with stu as "
            //    + "(select StudentGuid,StudentNO,LoginId,UserStateId,ClassName,StudentName,Address,c.ClassGuid,Sex,LoginPwd,GradeGuid from Student s "
            //    + "left join Class c on c.ClassGuid = s.ClassGuid "
            //    + "where (LEN(@Sex)=0 or CHARINDEX(@Sex,Sex)>0) and (LEN(@ClassName)=0 or CHARINDEX(@ClassName,ClassName)>0 )and (LEN(@StudentName)=0 or CHARINDEX(@StudentName,StudentName)>0) )"
            //    + "select * ,'Total' = (select count(*) from stu) from(select ROW_NUMBER() over(order by LoginId) as sortId, * from stu)TempTable"
            //    + " where sortId Between @pageMaxRowNumber*(@pageNumber - 1) + 1 and @pageMaxRowNumber*@pageNumber";

            string strSQL = "with stu as "
                + "(select StudentGuid,StudentNO,LoginId,UserStateId,ClassName,StudentName,Address,c.ClassGuid,Sex,LoginPwd,GradeGuid from Student s "
                + "left join Class c on c.ClassGuid = s.ClassGuid "
                + "where (LEN(@Sex)=0 or CHARINDEX(@Sex,Sex)>0) and (LEN(@ClassName)=0 or CHARINDEX(@ClassName,ClassName)>0 )and (LEN(@StudentName)=0 or CHARINDEX(@StudentName,StudentName)>0) )"
                + "select * ,'Total'=(select count(*) from stu) from stu"
                + " order by LoginId offset @pageMaxRowNumber * (@pageNumber - 1) rows fetch next @pageMaxRowNumber rows only";

            using (IDataReader reader = helper.ExecuteReader(strSQL, CommandType.Text,
                new SqlParameter("@Sex", p.Sex??""),
                new SqlParameter("@ClassName", p.ClassName??""),
                new SqlParameter("@StudentName", p.StudentName??""),
                new SqlParameter("@pageMaxRowNumber", p.PageMaxRowNumber),
                new SqlParameter("@pageNumber", p.PageNumber)
                ))
            {
                while (reader.Read())
                {
                    totalRows = reader.GetInt32(reader.GetOrdinal("Total"));
                    p.PageTotalNumber = Convert.ToInt32(Math.Ceiling(totalRows * 1.0 / p.PageMaxRowNumber));
                    yield return new Students()
                    {
                        StudentGuid = reader.GetString(reader.GetOrdinal("StudentGuid")),
                        StudentNO = reader.GetString(reader.GetOrdinal("StudentNO")),
                        LoginId = reader.GetString(reader.GetOrdinal("LoginId")),
                        UserStateId = reader.GetInt32(reader.GetOrdinal("UserStateId")),
                        classs = new Class()
                        {
                            ClassName = reader.GetString(reader.GetOrdinal("ClassName")),
                            ClassGuid = reader.GetString(reader.GetOrdinal("ClassGuid")),
                            GradeGuid = reader.GetString(reader.GetOrdinal("GradeGuid")),
                        },
                        StudentName = reader.GetString(reader.GetOrdinal("StudentName")),
                        Address = reader.GetString(reader.GetOrdinal("Address")),
                        ClassGuid = reader.GetString(reader.GetOrdinal("ClassGuid")),
                        LoginPwd = reader.GetString(reader.GetOrdinal("LoginPwd")),
                        Sex = reader.GetString(reader.GetOrdinal("Sex"))
                    };
                }
            }
        }

        public IEnumerable<Class> QueryClass()
        {
            string strSql = "select * from Class";
            using (IDataReader reader = helper.ExecuteReader(strSql, CommandType.Text))
            {
                while (reader.Read())
                {
                    yield return new Class()
                    {
                        ClassGuid = reader.GetString(reader.GetOrdinal("ClassGuid")),
                        ClassName = reader.GetString(reader.GetOrdinal("ClassName"))
                    };
                }
                reader.Close();
            }
        }

        public IEnumerable<Students> QueryByStuGuid(StudentQueryParameter p)
        {
            string str = "	select * from Student s inner join Class c on c.ClassGuid = s.ClassGuid where StudentGuid=@StudentGuid";
            using (IDataReader reader = helper.ExecuteReader(str, CommandType.Text, new SqlParameter("@StudentGuid", p.StudentGuid)))
            {
                while (reader.Read())
                {
                    yield return new Students()
                    {
                        LoginPwd = reader.GetString(reader.GetOrdinal("LoginPwd")),
                        StudentNO = reader.GetString(reader.GetOrdinal("StudentNO")),
                        LoginId = reader.GetString(reader.GetOrdinal("LoginId")),
                        UserStateId = reader.GetInt32(reader.GetOrdinal("UserStateId")),
                        ClassName = reader.GetString(reader.GetOrdinal("ClassName")),
                        StudentName = reader.GetString(reader.GetOrdinal("StudentName")),
                        Address = reader.GetString(reader.GetOrdinal("Address")),
                        Sex = reader.GetString(reader.GetOrdinal("Sex"))
                    };
                }
            }
        }

        public int Insert(Students stu)
        {
            string strSQL = "	insert into Student (StudentGuid,LoginId,LoginPwd,UserStateId,StudentNo,StudentName,Sex,Address,ClassGuid) values (@StudentGuid,@LoginId,@LoginPwd,@UserStateId,@StudentNo,@StudentName,@Sex,@Address,@ClassGuid)";
            return helper.ExecuteNonQuery(strSQL, CommandType.Text,
                new SqlParameter("@StudentGuid", Guid.NewGuid()),
                new SqlParameter("@LoginId", stu.LoginId),
                new SqlParameter("@LoginPwd", stu.LoginPwd),
                new SqlParameter("@UserStateId", 1),
                new SqlParameter("@StudentNo", stu.StudentNO),
                new SqlParameter("@StudentName", stu.StudentName),
                new SqlParameter("@Sex", stu.Sex),
                new SqlParameter("@Address", stu.Address),
                new SqlParameter("@ClassGuid", stu.ClassGuid)
                );
        }

        public int Delete(string stuGuid)
        {
            string strSql = "	delete  from Student where StudentGuid=@StudentGuid";
            return helper.ExecuteNonQuery(strSql, CommandType.Text, new SqlParameter("@StudentGuid", stuGuid));
        }

        public int UpdataPwd(string stuGuid, string pwd)
        {
            string strSQL = "update Student set LoginPwd=@LoginPwd where StudentGuid=@StudentGuid";
            return helper.ExecuteNonQuery(strSQL, CommandType.Text, new SqlParameter("@StudentGuid", stuGuid),
                new SqlParameter("@LoginPwd", pwd));
        }

        public int Updata(Students stu)
        {
            string strSQL = "	update Student set LoginId=@LoginId,UserStateId=@UserStateId,StudentNo=@StudentNo,StudentName=@StudentName,Sex=@Sex,Address=@Address,ClassGuid=@ClassGuid where StudentGuid=@StudentGuid";
            return helper.ExecuteNonQuery(strSQL, CommandType.Text,
                new SqlParameter("@StudentGuid", stu.StudentGuid),
                new SqlParameter("@LoginId", stu.LoginId),
                new SqlParameter("@UserStateId", stu.UserStateId),
                new SqlParameter("@StudentNo", stu.StudentNO),
                new SqlParameter("@StudentName", stu.StudentName),
                new SqlParameter("@Sex", stu.Sex),
                new SqlParameter("@Address", stu.Address),
                new SqlParameter("@ClassGuid", stu.ClassGuid)
                );
        }

        public int Login(Students u)
        {
            throw new NotImplementedException();
        }

        public int Add(Students u)
        {
            throw new NotImplementedException();
        }

        public int QueryFirst(User u)
        {
            throw new NotImplementedException();
        }
    }
}
