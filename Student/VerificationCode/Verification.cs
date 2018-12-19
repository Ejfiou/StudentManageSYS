using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
namespace Student.VerificationCode
{
    public class Verification
    {
        //  验证码长度(默认4个验证码的长度)  
        private int length = 4;
        public int Length
        {
            get { return length; }
            set { length = value; }
        }

        // 验证码字体大小(为了显示扭曲效果，默认40像素，可以自行修改)  

        int fontSize = 40;
        public int FontSize
        {
            get { return fontSize; }
            set { fontSize = value; }
        }
        //边框补(默认1像素)  
        int padding = 2;
        public int Padding
        {
            get { return padding; }
            set { padding = value; }
        }
        //是否输出燥点(默认不输出)  
        bool chaos = true;
        public bool Chaos
        {
            get { return chaos; }
            set { chaos = value; }
        }
        //输出燥点的颜色(默认灰色)  

        Color chaosColor = Color.Gray;
        public Color ChaosColor
        {
            get { return chaosColor; }
            set { chaosColor = value; }
        }
        //自定义背景色(默认白色)  
        Color backgroundColor = Color.White;
        public Color BackgroundColor
        {
            get { return backgroundColor; }
            set { backgroundColor = value; }
        }
        //自定义随机颜色数组  
        Color[] colors = { Color.Black, Color.Red, Color.DarkBlue, Color.Green, Color.Orange, Color.Brown, Color.DarkCyan, Color.Purple };
        public Color[] Colors
        {
            get { return colors; }
            set { colors = value; }
        }
        //自定义字体数组  
        string[] fonts = { "Arial", "Georgia" };
        public string[] Fonts
        {
            get { return fonts; }
            set { fonts = value; }
        }
        //自定义随机码字符串序列(使用逗号分隔)
        string codeSerial = "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
        public string CodeSerial
        {
            get { return codeSerial; }
            set { codeSerial = value; }
        }
    }
}
