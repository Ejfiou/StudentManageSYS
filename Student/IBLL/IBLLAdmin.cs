using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Student.ModelStu;
using Student.ModelStuView;
namespace Student.IBLL
{
    public interface IBLLAdmin
    {
        bool Add(User u);

        bool IsLoginIdRepeat(User u);

        IEnumerable<User> QueryByStuGuid(StudentQueryParameter p);

        bool UpdataPwd(string stuGuid, string pwd);
    }
}
