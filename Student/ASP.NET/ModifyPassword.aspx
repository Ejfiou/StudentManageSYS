<%@ Page Language="C#"  AutoEventWireup="true"  MasterPageFile="~/Layout.master" CodeFile="ModifyPassword.aspx.cs" Inherits="ModifyPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style1 {
        height: 25px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
         <h2>修改密码</h2>
    <div>
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="旧密码："></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtOldPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPwd" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label2" runat="server" Text="新密码："></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPwd" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1" >
                    <asp:Label ID="Label3" runat="server" Text="确认密码："></asp:Label>
                </td>
                <td class="auto-style1" >
                    <asp:TextBox ID="txtRePwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRePwd" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToCompare="txtNewPwd" ControlToValidate="txtRePwd" ErrorMessage="两次密码不匹配" ForeColor="#FF3300" Display="Dynamic"></asp:CompareValidator>
                </td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnModify" runat="server" Text="修改" OnClick="btnModify_Click" style="height: 21px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
        </asp:Panel>
    </asp:Content>




<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 85px;
        }
        .auto-style2 {
            width: 306px;
        }
    </style>
</head>
<body>
    <h1>修改密码</h1>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="旧密码："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtOldPwd" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" Text="新密码："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtNewPwd" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label3" runat="server" Text="确认密码："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtRePwd" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToCompare="txtNewPwd" ControlToValidate="txtRePwd" ErrorMessage="两次密码不匹配" ForeColor="#FF3300"></asp:CompareValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnModify" runat="server" Text="修改" OnClick="btnModify_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>--%>
