using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Student.ModelStu;
using Student.ModelStuView;
namespace Student.IDAL
{
    public interface ICommon<T>
    {
        Task<IEnumerable<T>> QueryAllAsync(StudentQueryParameter p);

        IEnumerable<T> QueryAll(StudentQueryParameter p);

        IEnumerable<T> QueryByStuGuid(StudentQueryParameter p);

        int Insert(T stu);

        int Delete(string stuGuid);

        int UpdataPwd(string stuGuid, string pwd);

        int Updata(T stu);

        int Login(T u);

        int Add(T u);

        int QueryFirst(User u);

    }
}
