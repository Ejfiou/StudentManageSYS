<%@ WebHandler Language="C#" Class="VerificationHandler" %>

using System;
using System.Web;
using Student.BLL;
using System.Text;
using System.Web.SessionState;
using Student.ModelStuView;
using System.Drawing;


public class VerificationHandler : IHttpHandler,IRequiresSessionState
{
    //private BLLVerificationCode verification = new BLLVerificationCode();

    public void ProcessRequest(HttpContext context)
    {
        //// 将创建好的图片输出到页面
        //string code = verification.CreateVerifyCode(0);
        //context.Session.Add("VerificationCode", code);
        //System.IO.MemoryStream ms = new System.IO.MemoryStream();
        //Bitmap image = verification.CreateImageCode(code);
        //image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
        //context.Response.ClearContent();
        //context.Response.ContentType = "image/Jpeg";
        //context.Response.BinaryWrite(ms.GetBuffer());
        ////释放
        //ms.Close();
        //ms = null;
        //image.Dispose();
        //image = null;

    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }



}