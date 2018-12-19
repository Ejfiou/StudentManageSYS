using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Student.IDAL;
using Student.ModelStu;
using Student.ModelStuView;
namespace Student.DALMSSQLEF
{
    public class DALStudentSeacher : IDALStudentSeacher
    {
        private MySchoolMSSQLEntities db = new MySchoolMSSQLEntities();

        public int Add(Students u)
        {
            throw new NotImplementedException();
        }

        public int Delete(string stuGuid)
        {
            throw new NotImplementedException();
        }

        public int Insert(Students stu)
        {
            throw new NotImplementedException();
            //int rows = 0;
            //db.Students.Add(stu);
            //rows = db.SaveChanges();
            //return rows;
        }

        public int Login(Students u)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Students> QueryAll(StudentQueryParameter p)
        {
            throw new NotImplementedException();
            // return db.Students.Include("LoginId").OrderBy(t => t.LoginId).AsEnumerable();
        }

        public Task<IEnumerable<Students>> QueryAllAsync(StudentQueryParameter p)
        {
            return Task<IEnumerable<Students>>.Run(() =>
            {
                return QueryAll(p);
            });
        }

        public IEnumerable<Students> QueryByStuGuid(StudentQueryParameter p)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Class> QueryClass()
        {
            throw new NotImplementedException();
        }

        public int QueryFirst(User u)
        {
            throw new NotImplementedException();
        }

        public int Updata(Students stu)
        {
            throw new NotImplementedException();
            //int rows = 0;

            //db.Entry(stu)
        }

        public int UpdataPwd(string stuGuid, string pwd)
        {
            throw new NotImplementedException();
        }
    }
}
