using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Student.DALMSSQL;
using Student.IDAL;
using Student.DALAbstractFactory;
namespace Student.DALMSSQLFactory
{
    public class DALFactory: AbstractDALFactory
    {
        public override IDALLogin CreateIDALLogin()
        {
            return new DALLogin();
        }

        public override IDALStudentSeacher CreateIDALStudentSeacher()
        {
            return new DALStudentSeacher();
        }
    }
}
