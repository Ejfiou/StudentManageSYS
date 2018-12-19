using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//using Student.DALMySQL;
using Student.ModelStu;
using Student.IDAL;
using Student.IBLL;
using Student.DALAbstractFactory;
namespace Student.BLL
{
   
    public class BLLLogin:IBLLLogin
    {
        //private IDALLogin log = new DALLogin();


        private IDALLogin log = AbstractDALFactory.CreateDALFactory().CreateIDALLogin();
        public bool Login(User u)
        {
            bool flag = false;

            if (log.Login(u)>0)
            {
                flag = true;
            }
            return flag;
        }
    }
}
