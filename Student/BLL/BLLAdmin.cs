using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Student.ModelStu;
using Student.IBLL;
using Student.DALMSSQL;
using Student.IDAL;
using Student.DALAbstractFactory;
using Student.ModelStuView;
namespace Student.BLL
{
    public class BLLAdmin:IBLLAdmin
    {
        IDALLogin log = AbstractDALFactory.CreateDALFactory().CreateIDALLogin();

        public bool Add(User u)
        {
            bool flag = false;

            if (log.Add(u)>0)
            {
                flag = true;
            }

            return flag;
        }

        public bool IsLoginIdRepeat(User u)
        {
            bool flag = false;

            if (log.QueryFirst(u)>0)
            {
                flag = true;
            }
            return flag;
        }

        public IEnumerable<User> QueryByStuGuid(StudentQueryParameter p)
        {
            return log.QueryByStuGuid(p);
        }

        public bool UpdataPwd(string stuGuid, string pwd)
        {
            bool flag = false;

            if (log.UpdataPwd(stuGuid,pwd)>0)
            {
                flag = true;
            }

            return flag;
        }
    }
}
