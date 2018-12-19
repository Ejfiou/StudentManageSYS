<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // 在应用程序启动时运行的代码
        this.Application["totalCount"] = 0;
    }

    void Application_End(object sender, EventArgs e)
    {
        //  在应用程序关闭时运行的代码

    }

    void Application_Error(object sender, EventArgs e)
    {
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e)
    {
        // 在新会话启动时运行的代码
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
        totalCount++;
        this.Application["totalCount"] = totalCount;
    }

    void Session_End(object sender, EventArgs e)
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer
        // 或 SQLServer，则不引发该事件。

    }

</script>
