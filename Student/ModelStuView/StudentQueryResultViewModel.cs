using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Student.ModelStuView
{
    public class StudentQueryResultViewModel
    {
        public int PageNumber { get; set; }

        public int PageTotalNumber { get; set; }

        public IEnumerable<StudentQueryItem> Rows { get; set; }
    }

    public class StudentQueryItem
    {
        public string StudentGuid { get; set; }

        public string LoginId { get; set; }

        public string ClassName { get; set; }

        public string StudentNO { get; set; }

        public string StudentName { get; set; }

        public string Sex { get; set; }

        public string Address { get; set; }
    }


}
