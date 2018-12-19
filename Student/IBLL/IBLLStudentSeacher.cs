using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Student.ModelStu;
using Student.ModelStuView;
namespace Student.IBLL
{
    public interface IBLLStudentSeacher
    {
        IEnumerable<Students> QueryAll(StudentQueryParameter p);

        Task<IEnumerable<Students>> QueryAllAsync(StudentQueryParameter p);

        IEnumerable<Class> QueryClass();

        IEnumerable<Students> QueryByStuGuid(StudentQueryParameter p);

        bool Del(string stuGuid);

        bool Insert(Students stu);

        bool UpdataPwd(string stuGuid, string pwd);

        bool Updata(Students stu);
    }
}
