using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Student.ModelStuView
{
    public class StudentQueryParameter
    {
        public string ClassName { get; set; }
        public string Sex { get; set; }

        public string StudentGuid { get; set; }

        public string StudentName { get; set; }

        public int PageMaxRowNumber { get; set; }//每页呈现的最大行数

        public int PageNumber { get; set; }//页数


        public int PageTotalNumber { get; set; }//总页数
    }
}
