using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Student.ModelStu;
using Student.ModelStuView;
namespace Student.IDAL
{
    public interface IDALStudentSeacher:ICommon<Students>
    {
        IEnumerable<Class> QueryClass();
    }
}
