using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Student.ModelStu;
using Student.ModelStuView;
using Student.IDAL;
//using Student.DALMySQL;
using Student.IBLL;
using Student.DALAbstractFactory;
namespace Student.BLL
{
    public class BLLStudentSeacher:IBLLStudentSeacher
    {

        private IDALStudentSeacher dals = AbstractDALFactory.CreateDALFactory().CreateIDALStudentSeacher();
        public IEnumerable<Students> QueryAll(StudentQueryParameter p)
        {
            return dals.QueryAll(p);
        }

        public Task<IEnumerable<Students>> QueryAllAsync(StudentQueryParameter p)
        {
            return dals.QueryAllAsync(p);
        }

        public IEnumerable<Class> QueryClass()
        {
            return dals.QueryClass();
        }

        public IEnumerable<Students> QueryByStuGuid(StudentQueryParameter p)
        {
            return dals.QueryByStuGuid(p);
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="stuGuid"></param>
        /// <returns></returns>
        public bool Del(string stuGuid)
        {
            bool flag = false;
            if (dals.Delete(stuGuid) > 0)
            {
                flag = true;
            }
            return flag;
        }

        /// <summary>
        /// 插入数据
        /// </summary>
        /// <param name="stu"></param>
        /// <returns></returns>
        public bool Insert(Students stu)
        {
            bool flag = false;

            if (dals.Insert(stu) > 0)
            {
                flag = true;
            }
            return flag;
        }

        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="stuGuid"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public bool UpdataPwd(string stuGuid, string pwd)
        {
            bool flag = false;
            int a = dals.UpdataPwd(stuGuid, pwd);

            if (a > 0)
            {
                flag = true;
            }
            return flag;
        }

        /// <summary>
        /// 更新数据内容
        /// </summary>
        /// <param name="stu"></param>
        /// <returns></returns>
        public bool Updata(Students stu)
        {
            bool flag = false;
            if (dals.Updata(stu) > 0)
            {
                flag = true;
            }
            return flag;
        }

    }
}
