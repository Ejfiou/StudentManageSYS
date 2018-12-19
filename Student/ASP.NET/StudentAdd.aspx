<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Layout.master" CodeFile="StudentAdd.aspx.cs" Inherits="StudentAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <h1>增加学生</h1>
        <table style="height:30px">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="登录账号：" AssociatedControlID="txtUserName"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label2" runat="server" Text="登录密码：" AssociatedControlID="txtUserPwd"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUserPwd" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtUserPwd" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label3" runat="server" Text="学生学号：" AssociatedControlID="txtStuNo"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="txtStuNo" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtStuNo" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" >
                    <asp:Label ID="Label4" runat="server" Text="学生姓名：" AssociatedControlID="txtName"></asp:Label>
                </td>
                <td class="auto-style1" >
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label5" runat="server" Text="学生状态：" AssociatedControlID="cboState"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="cboState" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="1">有效</asp:ListItem>
                        <asp:ListItem Value="0">无效</asp:ListItem>
                    </asp:DropDownList>
&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="cboState" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label6" runat="server" Text="学生性别：" AssociatedControlID="rdoMale"></asp:Label>
                </td>
                <td >
                    <asp:Panel ID="Panel2" runat="server" Width="147px">
                        <asp:RadioButton GroupName="sex" ID="rdoMale" runat="server" Text="男" />
                        &nbsp;&nbsp;
                        <asp:RadioButton GroupName="sex" ID="rdoFamel" runat="server" Text="女" />
                    </asp:Panel>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label7" runat="server" Text="学生地址：" AssociatedControlID="txtAddress"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label8" runat="server" Text="班级：" AssociatedControlID="cboClassGuid"></asp:Label>
                </td>
                <td >
                    <asp:DropDownList ID="cboClassGuid" runat="server">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="cboClassGuid" Display="Dynamic" ErrorMessage="必填" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnInsert"  runat="server" Text="添加" OnClick="btnInsert_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>

</asp:Panel>
</asp:Content>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 81px;
        }
        .auto-style2 {
            width: 53px;
        }
        .auto-style3 {
            width: 100%;
            margin-right: 0px;
        }
        .auto-style4 {
            width: 81px;
            height: 20px;
        }
        .auto-style5 {
            width: 53px;
            height: 20px;
        }
        .auto-style6 {
            height: 20px;
        }
        .auto-style7 {
            width: 81px;
            height: 23px;
        }
        .auto-style8 {
            width: 53px;
            height: 23px;
        }
        .auto-style9 {
            height: 23px;
        }
    </style>
</head>
<body>
    <h1>增加学生</h1>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style3">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="登录账号："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label2" runat="server" Text="登录密码："></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtUserPwd" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label3" runat="server" Text="学生学号："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtStuNo" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label4" runat="server" Text="学生姓名："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label5" runat="server" Text="学生状态："></asp:Label>
                </td>
                <td class="auto-style2">
                    <select id="cboState" name="cboState">
                        <option value="1">在线</option>
                        <option value="0">离线</option>
                    </select>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label6" runat="server" Text="学生性别："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Panel ID="Panel1" runat="server" Width="147px">
                        <asp:RadioButton GroupName="sex" ID="rdoMale" runat="server" Text="男" />
                        <asp:RadioButton GroupName="sex" ID="rdoFamel" runat="server" Text="女" />
                    </asp:Panel>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label7" runat="server" Text="学生地址："></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label8" runat="server" Text="班级："></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="cboClassGuid" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" DataValueField="ClassGuid">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MySchoolConnectionString %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                </td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnInsert"  runat="server" Text="添加" OnClick="btnInsert_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>--%>
