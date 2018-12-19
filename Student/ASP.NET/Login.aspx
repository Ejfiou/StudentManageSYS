<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            height: 23px;
            width: 80px;
        }
        .auto-style4 {
            width: 291px;
            height: 41px;
        }
        .auto-style5 {
            height: 23px;
            width: 291px;
        }

        .auto-style7 {
            width: 80px;
            height: 57px;
        }
        .auto-style8 {
            width: 291px;
            height: 57px;
        }
        .auto-style11 {
            height: 29px;
            width: 80px;
        }
        .auto-style12 {
            height: 29px;
            width: 291px;
        }
        .auto-style13 {
            height: 25px;
            width: 80px;
        }
        .auto-style14 {
            height: 25px;
            width: 291px;
        }
        .auto-style15 {
            width: 80px;
            height: 41px;
        }
        .auto-style16 {
            width: 51%;
            height: 234px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblTotalCount" runat="server" Font-Bold="True" Text="欢迎光临！您是第个访问该网站"></asp:Label>
        <br />
        <br />
        <table class="auto-style16">
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="Label2" runat="server" Text="用户名："></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtUserName" runat="server" style="margin-left: 0px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="用户名不能为空" SetFocusOnError="True" Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="用户名至少为两个连续字符！" ForeColor="#FF3300" SetFocusOnError="True" ValidationExpression="^\w{2,}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">密码：</td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtUserPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserPwd" ErrorMessage="密码不能为空" SetFocusOnError="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td  class="auto-style7">验证码：</td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtVerificationCode" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtVerificationCode" ErrorMessage="验证码不能为空" SetFocusOnError="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="Label3" runat="server" ForeColor="Gray" Text="请输入下图的字符,不区分大小写"></asp:Label>
                    <br />
                    <asp:Image ID="vimg" runat="server" ImageUrl="VerificationCodeHandler.ashx" onclick="refresh()"/>
                    <asp:HyperLink ID="HyperLink1" runat="server" onclick="refresh()" NavigateUrl="javascript:void(0);" >看不清,换一张</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    </td>
                <td class="auto-style14">
                    <asp:CheckBox ID="remember" runat="server" Text="记住我？" />
                </td>
            </tr>
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style12">
                    <asp:Button ID="btnLog" runat="server" Text="登录" OnClick="btnLog_Click" />
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Register.aspx">注册</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
    </form>

    <script src="Scripts/jquery.js"></script>
     <script>

        function refresh() {
            $('#vimg').attr('src', 'VerificationCodeHandler.ashx?t=' + new Date().valueOf());
        }

        $(function () {
        //    $('#btnLog').on('click', function () {
        //        var txtUserName = $('#txtUserName').val();
        //        var txtUserPwd = $('#txtUserPwd').val();
        //        var inputCode = $('#code').val().toUpperCase();

        //        //验证数据合法性
        //        if (!txtUserName) {
        //            alert('用户名不能为空');
        //            $('#txtUserName').focus();
        //            return false;
        //        }

        //        if (!(/^\w{2,}$/).test(txtUserName)) {
        //            alert('用户名至少为两个连续字符！');
        //            $('#txtUserName').focus();
        //            return false;
        //        }

        //        if (!txtUserPwd) {
        //            alert('密码不能为空');
        //            $('#txtUserPwd').focus();
        //            return false;
        //        }

        //        if (inputCode.length <= 0) {
        //            alert("请输入验证码！");
        //            return false;
        //        } 
        //    });
        });
    </script>
</body>
</html>
