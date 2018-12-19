using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Student.ModelStu;

namespace Student.IBLL
{
    public interface IBLLLogin
    {
        bool Login(User u);
    }
}
