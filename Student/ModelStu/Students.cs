using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Student.ModelStu
{
    public class Students
    {
        public string StudentGuid { get; set; }

        public string LoginId { get; set; }

        public string LoginPwd { get; set; }

        public int UserStateId { get; set; }

        public string ClassGuid { get; set; }

        public string StudentNO { get; set; }

        public string StudentName { get; set; }

        public string Sex { get; set; }

        public string Address { get; set; }

        public string ClassName { get; set; }
        public Class classs { get; set; }
    }
}
