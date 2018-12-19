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
    public class DALLogin : IDALLogin
    {
        private MySchoolMSSQLEntities db = new MySchoolMSSQLEntities();

        public int Add(User u)
        {
            throw new NotImplementedException();
        }

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
            Admin ad = db.Admins.Where((a) =>(a.LoginId == u.LoginId) && (a.LoginPwd == u.LoginPwd)).FirstOrDefault();
            return Convert.ToInt32(ad);
        }

        public IEnumerable<User> QueryAll(Student.ModelStuView.StudentQueryParameter p)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<User>> QueryAllAsync(Student.ModelStuView.StudentQueryParameter p)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<User> QueryByStuGuid(Student.ModelStuView.StudentQueryParameter p)
        {
            throw new NotImplementedException();
        }

        public int QueryFirst(User u)
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

        //public int Add (User u)
        //{
        //    //db.Admins.Add(u);
        //    //return db.SaveChanges();
        //}
    }
}
