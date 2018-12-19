using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;

/// <summary>
/// MyAsyncResult 的摘要说明
/// </summary>
public class MyAsyncResult:IAsyncResult
{
    public MyAsyncResult()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public object AsyncState
    {
        get
        {
            return null;
        }
    }

    public WaitHandle AsyncWaitHandle
    {
        get
        {
            return null;
        }
    }

    public bool CompletedSynchronously
    {
        get
        {
            return false;
        }
    }

    public bool IsCompleted
    {
        get
        {
            return true;
        }
    }
}