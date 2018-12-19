using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ASP.NET_MVC
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            this.Application["totalCount"] = 0;
        }

        protected void Session_Start()
        {
            // 在新会话启动时运行的代码
            this.Application.Lock();
            object totalCountObj = this.Application["totalCount"];
            int totalCount = 0;
            if (totalCountObj == null)
            {
                totalCount = 0;
            }
            else
            {
                if (!int.TryParse(totalCountObj.ToString(), out totalCount))
                {
                    totalCount = 0;
                }
            }
            totalCount += 1;
            this.Application["totalCount"] = totalCount;

            this.Application.UnLock();
        }
    }
}
