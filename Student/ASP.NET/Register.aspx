<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
        }
        .auto-style2 {
            width: 112px;
            height: 20px;
        }
        .auto-style3 {
            height: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 21px">
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" AssociatedControlID="txtUserName" Text="用户名："></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    <asp:Image ID="imgWaiting" runat="server" Height="20px" Width="20px" ImageUrl="~/images/0.gif" />
                    <asp:Label ID="result" runat="server" ForeColor="#FF3300"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="用户名不能为空" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" AssociatedControlID="txtUserPwd" Text="密码："></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUserPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserPwd" Display="Dynamic" ErrorMessage="密码不能为空" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" AssociatedControlID="txtReUserPwd" Text="确认密码："></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtReUserPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtReUserPwd" Display="Dynamic" ErrorMessage="确认密码不能为空" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtUserPwd" ControlToValidate="txtReUserPwd" Display="Dynamic" ErrorMessage="密码不一致" ForeColor="#FF3300" SetFocusOnError="True"></asp:CompareValidator>
                </td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2" align="center">
                    <asp:Button ID="btnReg"  runat="server" OnClick="btnReg_Click" Text="注册" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
    
    </div>
    </form>

    <script  src="Scripts/jquery.js"></script>
    <script>
        $(function () {
            $('#imgWaiting').hide();

            $('#txtUserName').on('change', function () {
                $.ajax({
                    //url: '/IsLoginIdRepeatHandler.ashx',
                    url: '/WebService.asmx/IsLoginIdRepeat',
                    type: 'POST',//get
                    async: true,//是否异步提交
                    data: 'txtUserName=' + $('#txtUserName').val(),
                    dataType: 'text', //返回的数据格式:json/xml/html/script/text
                    beforeSend:function(data){
                        $('#imgWaiting').show();
                    },
                    success: function (data) {
                        if (data === 'True') {
                            $('#result').html('用户名已存在');
                            $('#btnReg').attr('disabled', true);
                        }
                        else {
                            $('#result').html('可以使用');
                            $('#btnReg').attr('disabled', false);
                        }
                    },
                    complete:function(){
                        $('#imgWaiting').hide();
                    }
                });    
            });
        })
    </script>
</body>
</html>
