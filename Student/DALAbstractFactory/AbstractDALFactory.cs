using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Student.IDAL;
using System.Reflection;
using System.Configuration;
namespace Student.DALAbstractFactory
{
   
    public abstract class AbstractDALFactory
    {
        //单列模式
        private static AbstractDALFactory factory = null;
        public static AbstractDALFactory CreateDALFactory()
        {
            //返回的是具体的工厂对象


            if (factory == null)//实例化一次
            {
                string myChoice = ConfigurationManager.AppSettings["myChoice"];

                //代码的方式引用程序集
                Assembly dalFactory = Assembly.Load("DAL" + myChoice + "Factory");

                if (dalFactory != null)
                {
                    //代码方式返回的是具体的工厂对象
                    factory = dalFactory.CreateInstance("Student.DAL" + myChoice + "Factory.DALFactory") as AbstractDALFactory;
                } 
            }

            return factory;
        }

        public abstract IDALLogin CreateIDALLogin();

        public abstract IDALStudentSeacher CreateIDALStudentSeacher();
    }
}
